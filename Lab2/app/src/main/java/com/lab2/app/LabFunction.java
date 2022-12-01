package com.lab2.app;

public class LabFunction implements Function {
    private final double b;

    public LabFunction(double b) {
        this.b = b;
    }

    @Override
    public double f(double x) {
        if (Math.abs(b * x - 0.45) < 0.00001)
            return 1;
        else if (b * x < 0.45)
            return b * x - Math.log10(b * x);
        else
            return b * x + Math.log10(b * x);
    }

    public double getB() {
        return b;
    }
}
