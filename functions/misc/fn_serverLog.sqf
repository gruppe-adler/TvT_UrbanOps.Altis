if (typeName _this == "ARRAY") then {
  diag_log format _this;
} else {
  if (typeName _this  == "STRING") then {
    diag_log _this;
  } else {
    diag_log str _this;
  };
};
