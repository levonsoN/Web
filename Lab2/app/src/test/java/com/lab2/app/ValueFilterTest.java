package com.lab2.app;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ValueFilterTest {

    @Test
    void findExtremaMin() {
        Value[] sample = new Value[]{
                new Value(0, 1),
                new Value(0, -1),
                new Value(0, 2),
        };
        assertEquals(1, new ValueFilter().findExtrema(sample, true));
    }

    @Test
    void findExtemaMax() {
        Value[] sample = new Value[]{
                new Value(0, 1),
                new Value(0, -1),
                new Value(0, 2),
        };
        assertEquals(2, new ValueFilter().findExtrema(sample, false));
    }

    @Test
    void sumValues() {
        Value[] sample = new Value[]{
                new Value(0, 1),
                new Value(0, -1),
                new Value(0, 2),
        };
        assertEquals(2, new ValueFilter().sumValues(sample), 0.00001);
    }

    @Test
    void avgValues() {
        Value[] sample = new Value[]{
                new Value(0, 1),
                new Value(0, -1),
                new Value(0, 2),
        };
        assertEquals(2.0 / 3, new ValueFilter().avgValues(sample), 0.00001);
    }
}