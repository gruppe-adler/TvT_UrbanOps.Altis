class uo_ui {
    class confirmHint {
        file = dialogs\confirmHint\functions;

        class confirmHint {};
    };

    class showTimeLeft {
        file = dialogs\showTimeLeft\functions;

        class addShowTimeLeftKeyEH {postInit = 1;};
        class onTimeLeftKeyDown {};
    };

    class twoLineHint {
        file = dialogs\twoLineHint\functions;

        class twoLineHint {};
    };

    class animatedHint {
        file = dialogs\animatedHint\functions;

        class animatedHint {};
    };
};
