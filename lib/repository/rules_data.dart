const RULES_DATA = [
  {
    "if": [
      {
        "condition": "Has bow",
        "value": "true"
      }
    ],
    "then": {
      "condition": "type",
      "value": "bow"
    }
  },
  {
    "if": [
      {
        "condition": "Has bow",
        "value": "false"
      }
    ],
    "then": {
      "condition": "type",
      "value": "string"
    }
  },

  {
    "if": [
      {
        "condition": "type",
        "value": "string"
      },
      {
        "condition": "Has circle soundhole?",
        "value": "true"
      }
    ],
    "then": {
      "condition": "hollowed",
      "value": "true"
    }
  },
  {
    "if": [
      {
        "condition": "type",
        "value": "string"
      },
      {
        "condition": "Has circle soundhole?",
        "value": "false"
      }
    ],
    "then": {
      "condition": "hollowed",
      "value": "false"
    }
  },

  {
    "if": [
      {
        "condition": "More than 4 strings?",
        "value": "false"
      },
      {
        "condition": "hollowed",
        "value": "true"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Ukulele"
    }
  },
  {
    "if": [
      {
        "condition": "More than 4 strings?",
        "value": "false"
      },
      {
        "condition": "hollowed",
        "value": "false"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Bass guitar"
    }
  },
  {
    "if": [
      {
        "condition": "More than 4 strings?",
        "value": "true"
      },
      {
        "condition": "hollowed",
        "value": "false"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Electric guitar"
    }
  },
  {
    "if": [
      {
        "condition": "More than 4 strings?",
        "value": "true"
      },
      {
        "condition": "hollowed",
        "value": "true"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Acoustic guitar"
    }
  },
  {
    "if": [
      {
        "condition": "type",
        "value": "bow"
      },
      {
        "condition": "Has endpin?",
        "value": "true"
      }
    ],
    "then": {
      "condition": "endpinned",
      "value": "true"
    }
  },
  {
    "if": [
      {
        "condition": "type",
        "value": "bow"
      },
      {
        "condition": "Has endpin?",
        "value": "false"
      }
    ],
    "then": {
      "condition": "endpinned",
      "value": "false"
    }
  },
  {
    "if": [
      {
        "condition": "endpinned",
        "value": "false"
      },
      {
        "condition": "Smaller then Viola",
        "value": "true"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Violin"
    }
  },
  {
    "if": [
      {
        "condition": "endpinned",
        "value": "false"
      },
      {
        "condition": "Smaller then Viola",
        "value": "false"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Viola"
    }
  },
  {
    "if": [
      {
        "condition": "endpinned",
        "value": "true"
      },
      {
        "condition": "Smaller then Double Bass",
        "value": "false"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Double Bass"
    }
  },
  {
    "if": [
      {
        "condition": "endpinned",
        "value": "true"
      },
      {
        "condition": "Smaller then Double Bass",
        "value": "true"
      }
    ],
    "then": {
      "condition": "instrument",
      "value": "Violoncello"
    }
  }
];
