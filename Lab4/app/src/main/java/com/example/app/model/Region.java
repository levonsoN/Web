package com.example.app.model;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "regions")
public class Region {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "regionid", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 45)
    @Size(min = 2, message = "Length of name of Region should not be less than 2 characters")
    private String name;

    @Column(name = "area", nullable = false, precision = 10, scale = 2)
    @DecimalMin(value = "0", inclusive = false, message = "Area of Region should be greater than 0")
    private BigDecimal area;

    @OneToMany(mappedBy = "region")
    private List<Weather> weathers = new ArrayList<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getArea() {
        return area;
    }

    public void setArea(BigDecimal area) {
        this.area = area;
    }

    public List<Weather> getWeathers() {
        return weathers;
    }

    public void setWeathers(List<Weather> weathers) {
        this.weathers = weathers;
    }

}