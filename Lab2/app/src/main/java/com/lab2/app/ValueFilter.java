package com.lab2.app;

public class ValueFilter {
    public int findExtrema(Value[] values, boolean min) {
        if (values.length == 0)
            return -1;
        double extrema = values[0].getY(), m = min ? -1 : 1;
        int result = 0;
        for (int i = 0; i < values.length; i++)
            if (m * (values[i].getY() - extrema) > 0) {
                extrema = values[i].getY();
                result = i;
            }
        return result;
    }

    public double sumValues(Value[] values) {
        double result = 0;
        for (int i = 0; i < values.length; i++)
            result += values[i].getY();
        return result;
    }

    public double avgValues(Value[] values) {
        return sumValues(values) / values.length;
    }
}
