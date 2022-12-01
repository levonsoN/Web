package com.lab2.app;

public class Tabulator {
    private final Function function;

    public Tabulator(Function function) {
        this.function = function;
    }

    public Value[] tabulate(double a, double b, double h) {
        int count = (int) Math.round((b - a) / h) + 1;
        Value[] result = new Value[count];
        for (int i = 0; i < count; i++) {
            double x = a + i * h;
            result[i] = new Value(x, function.f(x));
        }
        return result;
    }

    public Function getFunction() {
        return function;
    }
}
