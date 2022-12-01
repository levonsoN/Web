package com.lab2.app;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TabulatorTest {
    private final Tabulator tabulator;

    public TabulatorTest() {
        tabulator = new Tabulator(new TestFunction());
    }

    @Test
    void tabulate() {
        Value[] actual = tabulator.tabulate(0, 1, 0.1);
        assertEquals(11, actual.length);
        if (actual.length == 11)
            for (int i = 0; i < 11; i++) {
                assertEquals(i * 0.1, actual[i].getX(), 0.00001);
                assertEquals(i * 0.1, actual[i].getY(), 0.00001);
            }
    }
}