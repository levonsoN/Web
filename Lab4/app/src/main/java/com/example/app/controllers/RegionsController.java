package com.example.app.controllers;

import com.example.app.dataaccess.RegionsRepository;
import com.example.app.model.Region;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/regions")
public class RegionsController {
    private RegionsRepository regionsRepository;

    @GetMapping
    public String inspectAllRegions(Model model) {
        List<Region> regions = regionsRepository.findAll();
        model.addAttribute("regions", regions);
        return "regions/inspectAllRegions";
    }

    @GetMapping("/{id}")
    public String inspectRegion(@PathVariable("id") int id, Model model) {
        model.addAttribute("region", regionsRepository.findById(id).orElseThrow());
        return "regions/inspectRegion";
    }

    @GetMapping("/new")
    public String newRegion(@ModelAttribute("region") Region region) {
        return "regions/newRegion";
    }

    @PostMapping("/new")
    public String makeNewRegion(@ModelAttribute @Valid Region region, BindingResult bindingResult) {
        if (bindingResult.hasErrors())
            return "regions/newRegion";
        regionsRepository.save(region);
        return "redirect:/regions";
    }

    @DeleteMapping("/{id}")
    public String deleteRegion(@PathVariable("id") int id) {
        regionsRepository.deleteById(id);
        return "redirect:/regions";
    }

    @GetMapping("/{id}/edit")
    public String editRegion(@PathVariable("id") int id, Model model) {
        model.addAttribute("region", regionsRepository.findById(id).orElseThrow());
        return "regions/editRegion";
    }

    @PatchMapping("/{id}/edit")
    public String makeEditRegion(@PathVariable("id") int id, @ModelAttribute("region") @Valid Region region, BindingResult bindingResult) {
        if (bindingResult.hasErrors())
            return "regions/editRegion";
        regionsRepository.save(region);
        return "redirect:/regions/" + id;
    }
}
