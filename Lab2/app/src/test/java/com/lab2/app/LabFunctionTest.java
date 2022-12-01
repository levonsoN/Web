package com.lab2.app;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class LabFunctionTest {
    private final LabFunction function;

    public LabFunctionTest() {
        function = new LabFunction(1.5);
    }

    @Test
    void f0() {
        assertEquals( 0.9739, function.f(0.1), 0.00001);
    }

    @Test
    void f200() {
        assertEquals( 1, function.f(0.3), 0.00001);
    }

    @Test
    void f900() {
        assertEquals( 1.67609, function.f(1), 0.00001);
    }

}