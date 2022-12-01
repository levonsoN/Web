package com.example.app.dataaccess;

import com.example.app.model.Region;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegionsRepository extends JpaRepository<Region, Integer> {
}