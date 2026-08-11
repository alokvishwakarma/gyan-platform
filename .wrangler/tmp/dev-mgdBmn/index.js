var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });
var __esm = (fn, res, err) => function __init() {
  if (err) throw err[0];
  try {
    return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
  } catch (e) {
    throw err = [e], e;
  }
};
var __commonJS = (cb, mod) => function __require() {
  try {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  } catch (e) {
    throw mod = 0, e;
  }
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// wrangler-modules-watch:wrangler:modules-watch
var init_wrangler_modules_watch = __esm({
  "wrangler-modules-watch:wrangler:modules-watch"() {
    init_modules_watch_stub();
  }
});

// ../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/modules-watch-stub.js
var init_modules_watch_stub = __esm({
  "../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/modules-watch-stub.js"() {
    init_wrangler_modules_watch();
  }
});

// node_modules/qrcode/lib/can-promise.js
var require_can_promise = __commonJS({
  "node_modules/qrcode/lib/can-promise.js"(exports, module) {
    init_modules_watch_stub();
    module.exports = function() {
      return typeof Promise === "function" && Promise.prototype && Promise.prototype.then;
    };
  }
});

// node_modules/qrcode/lib/core/utils.js
var require_utils = __commonJS({
  "node_modules/qrcode/lib/core/utils.js"(exports) {
    init_modules_watch_stub();
    var toSJISFunction;
    var CODEWORDS_COUNT = [
      0,
      // Not used
      26,
      44,
      70,
      100,
      134,
      172,
      196,
      242,
      292,
      346,
      404,
      466,
      532,
      581,
      655,
      733,
      815,
      901,
      991,
      1085,
      1156,
      1258,
      1364,
      1474,
      1588,
      1706,
      1828,
      1921,
      2051,
      2185,
      2323,
      2465,
      2611,
      2761,
      2876,
      3034,
      3196,
      3362,
      3532,
      3706
    ];
    exports.getSymbolSize = /* @__PURE__ */ __name(function getSymbolSize(version) {
      if (!version) throw new Error('"version" cannot be null or undefined');
      if (version < 1 || version > 40) throw new Error('"version" should be in range from 1 to 40');
      return version * 4 + 17;
    }, "getSymbolSize");
    exports.getSymbolTotalCodewords = /* @__PURE__ */ __name(function getSymbolTotalCodewords(version) {
      return CODEWORDS_COUNT[version];
    }, "getSymbolTotalCodewords");
    exports.getBCHDigit = function(data) {
      let digit = 0;
      while (data !== 0) {
        digit++;
        data >>>= 1;
      }
      return digit;
    };
    exports.setToSJISFunction = /* @__PURE__ */ __name(function setToSJISFunction(f) {
      if (typeof f !== "function") {
        throw new Error('"toSJISFunc" is not a valid function.');
      }
      toSJISFunction = f;
    }, "setToSJISFunction");
    exports.isKanjiModeEnabled = function() {
      return typeof toSJISFunction !== "undefined";
    };
    exports.toSJIS = /* @__PURE__ */ __name(function toSJIS(kanji) {
      return toSJISFunction(kanji);
    }, "toSJIS");
  }
});

// node_modules/qrcode/lib/core/error-correction-level.js
var require_error_correction_level = __commonJS({
  "node_modules/qrcode/lib/core/error-correction-level.js"(exports) {
    init_modules_watch_stub();
    exports.L = { bit: 1 };
    exports.M = { bit: 0 };
    exports.Q = { bit: 3 };
    exports.H = { bit: 2 };
    function fromString(string) {
      if (typeof string !== "string") {
        throw new Error("Param is not a string");
      }
      const lcStr = string.toLowerCase();
      switch (lcStr) {
        case "l":
        case "low":
          return exports.L;
        case "m":
        case "medium":
          return exports.M;
        case "q":
        case "quartile":
          return exports.Q;
        case "h":
        case "high":
          return exports.H;
        default:
          throw new Error("Unknown EC Level: " + string);
      }
    }
    __name(fromString, "fromString");
    exports.isValid = /* @__PURE__ */ __name(function isValid(level) {
      return level && typeof level.bit !== "undefined" && level.bit >= 0 && level.bit < 4;
    }, "isValid");
    exports.from = /* @__PURE__ */ __name(function from(value, defaultValue) {
      if (exports.isValid(value)) {
        return value;
      }
      try {
        return fromString(value);
      } catch (e) {
        return defaultValue;
      }
    }, "from");
  }
});

// node_modules/qrcode/lib/core/bit-buffer.js
var require_bit_buffer = __commonJS({
  "node_modules/qrcode/lib/core/bit-buffer.js"(exports, module) {
    init_modules_watch_stub();
    function BitBuffer() {
      this.buffer = [];
      this.length = 0;
    }
    __name(BitBuffer, "BitBuffer");
    BitBuffer.prototype = {
      get: /* @__PURE__ */ __name(function(index) {
        const bufIndex = Math.floor(index / 8);
        return (this.buffer[bufIndex] >>> 7 - index % 8 & 1) === 1;
      }, "get"),
      put: /* @__PURE__ */ __name(function(num, length) {
        for (let i = 0; i < length; i++) {
          this.putBit((num >>> length - i - 1 & 1) === 1);
        }
      }, "put"),
      getLengthInBits: /* @__PURE__ */ __name(function() {
        return this.length;
      }, "getLengthInBits"),
      putBit: /* @__PURE__ */ __name(function(bit) {
        const bufIndex = Math.floor(this.length / 8);
        if (this.buffer.length <= bufIndex) {
          this.buffer.push(0);
        }
        if (bit) {
          this.buffer[bufIndex] |= 128 >>> this.length % 8;
        }
        this.length++;
      }, "putBit")
    };
    module.exports = BitBuffer;
  }
});

// node_modules/qrcode/lib/core/bit-matrix.js
var require_bit_matrix = __commonJS({
  "node_modules/qrcode/lib/core/bit-matrix.js"(exports, module) {
    init_modules_watch_stub();
    function BitMatrix(size) {
      if (!size || size < 1) {
        throw new Error("BitMatrix size must be defined and greater than 0");
      }
      this.size = size;
      this.data = new Uint8Array(size * size);
      this.reservedBit = new Uint8Array(size * size);
    }
    __name(BitMatrix, "BitMatrix");
    BitMatrix.prototype.set = function(row, col, value, reserved) {
      const index = row * this.size + col;
      this.data[index] = value;
      if (reserved) this.reservedBit[index] = true;
    };
    BitMatrix.prototype.get = function(row, col) {
      return this.data[row * this.size + col];
    };
    BitMatrix.prototype.xor = function(row, col, value) {
      this.data[row * this.size + col] ^= value;
    };
    BitMatrix.prototype.isReserved = function(row, col) {
      return this.reservedBit[row * this.size + col];
    };
    module.exports = BitMatrix;
  }
});

// node_modules/qrcode/lib/core/alignment-pattern.js
var require_alignment_pattern = __commonJS({
  "node_modules/qrcode/lib/core/alignment-pattern.js"(exports) {
    init_modules_watch_stub();
    var getSymbolSize = require_utils().getSymbolSize;
    exports.getRowColCoords = /* @__PURE__ */ __name(function getRowColCoords(version) {
      if (version === 1) return [];
      const posCount = Math.floor(version / 7) + 2;
      const size = getSymbolSize(version);
      const intervals = size === 145 ? 26 : Math.ceil((size - 13) / (2 * posCount - 2)) * 2;
      const positions = [size - 7];
      for (let i = 1; i < posCount - 1; i++) {
        positions[i] = positions[i - 1] - intervals;
      }
      positions.push(6);
      return positions.reverse();
    }, "getRowColCoords");
    exports.getPositions = /* @__PURE__ */ __name(function getPositions(version) {
      const coords = [];
      const pos = exports.getRowColCoords(version);
      const posLength = pos.length;
      for (let i = 0; i < posLength; i++) {
        for (let j = 0; j < posLength; j++) {
          if (i === 0 && j === 0 || // top-left
          i === 0 && j === posLength - 1 || // bottom-left
          i === posLength - 1 && j === 0) {
            continue;
          }
          coords.push([pos[i], pos[j]]);
        }
      }
      return coords;
    }, "getPositions");
  }
});

// node_modules/qrcode/lib/core/finder-pattern.js
var require_finder_pattern = __commonJS({
  "node_modules/qrcode/lib/core/finder-pattern.js"(exports) {
    init_modules_watch_stub();
    var getSymbolSize = require_utils().getSymbolSize;
    var FINDER_PATTERN_SIZE = 7;
    exports.getPositions = /* @__PURE__ */ __name(function getPositions(version) {
      const size = getSymbolSize(version);
      return [
        // top-left
        [0, 0],
        // top-right
        [size - FINDER_PATTERN_SIZE, 0],
        // bottom-left
        [0, size - FINDER_PATTERN_SIZE]
      ];
    }, "getPositions");
  }
});

// node_modules/qrcode/lib/core/mask-pattern.js
var require_mask_pattern = __commonJS({
  "node_modules/qrcode/lib/core/mask-pattern.js"(exports) {
    init_modules_watch_stub();
    exports.Patterns = {
      PATTERN000: 0,
      PATTERN001: 1,
      PATTERN010: 2,
      PATTERN011: 3,
      PATTERN100: 4,
      PATTERN101: 5,
      PATTERN110: 6,
      PATTERN111: 7
    };
    var PenaltyScores = {
      N1: 3,
      N2: 3,
      N3: 40,
      N4: 10
    };
    exports.isValid = /* @__PURE__ */ __name(function isValid(mask) {
      return mask != null && mask !== "" && !isNaN(mask) && mask >= 0 && mask <= 7;
    }, "isValid");
    exports.from = /* @__PURE__ */ __name(function from(value) {
      return exports.isValid(value) ? parseInt(value, 10) : void 0;
    }, "from");
    exports.getPenaltyN1 = /* @__PURE__ */ __name(function getPenaltyN1(data) {
      const size = data.size;
      let points = 0;
      let sameCountCol = 0;
      let sameCountRow = 0;
      let lastCol = null;
      let lastRow = null;
      for (let row = 0; row < size; row++) {
        sameCountCol = sameCountRow = 0;
        lastCol = lastRow = null;
        for (let col = 0; col < size; col++) {
          let module2 = data.get(row, col);
          if (module2 === lastCol) {
            sameCountCol++;
          } else {
            if (sameCountCol >= 5) points += PenaltyScores.N1 + (sameCountCol - 5);
            lastCol = module2;
            sameCountCol = 1;
          }
          module2 = data.get(col, row);
          if (module2 === lastRow) {
            sameCountRow++;
          } else {
            if (sameCountRow >= 5) points += PenaltyScores.N1 + (sameCountRow - 5);
            lastRow = module2;
            sameCountRow = 1;
          }
        }
        if (sameCountCol >= 5) points += PenaltyScores.N1 + (sameCountCol - 5);
        if (sameCountRow >= 5) points += PenaltyScores.N1 + (sameCountRow - 5);
      }
      return points;
    }, "getPenaltyN1");
    exports.getPenaltyN2 = /* @__PURE__ */ __name(function getPenaltyN2(data) {
      const size = data.size;
      let points = 0;
      for (let row = 0; row < size - 1; row++) {
        for (let col = 0; col < size - 1; col++) {
          const last = data.get(row, col) + data.get(row, col + 1) + data.get(row + 1, col) + data.get(row + 1, col + 1);
          if (last === 4 || last === 0) points++;
        }
      }
      return points * PenaltyScores.N2;
    }, "getPenaltyN2");
    exports.getPenaltyN3 = /* @__PURE__ */ __name(function getPenaltyN3(data) {
      const size = data.size;
      let points = 0;
      let bitsCol = 0;
      let bitsRow = 0;
      for (let row = 0; row < size; row++) {
        bitsCol = bitsRow = 0;
        for (let col = 0; col < size; col++) {
          bitsCol = bitsCol << 1 & 2047 | data.get(row, col);
          if (col >= 10 && (bitsCol === 1488 || bitsCol === 93)) points++;
          bitsRow = bitsRow << 1 & 2047 | data.get(col, row);
          if (col >= 10 && (bitsRow === 1488 || bitsRow === 93)) points++;
        }
      }
      return points * PenaltyScores.N3;
    }, "getPenaltyN3");
    exports.getPenaltyN4 = /* @__PURE__ */ __name(function getPenaltyN4(data) {
      let darkCount = 0;
      const modulesCount = data.data.length;
      for (let i = 0; i < modulesCount; i++) darkCount += data.data[i];
      const k = Math.abs(Math.ceil(darkCount * 100 / modulesCount / 5) - 10);
      return k * PenaltyScores.N4;
    }, "getPenaltyN4");
    function getMaskAt(maskPattern, i, j) {
      switch (maskPattern) {
        case exports.Patterns.PATTERN000:
          return (i + j) % 2 === 0;
        case exports.Patterns.PATTERN001:
          return i % 2 === 0;
        case exports.Patterns.PATTERN010:
          return j % 3 === 0;
        case exports.Patterns.PATTERN011:
          return (i + j) % 3 === 0;
        case exports.Patterns.PATTERN100:
          return (Math.floor(i / 2) + Math.floor(j / 3)) % 2 === 0;
        case exports.Patterns.PATTERN101:
          return i * j % 2 + i * j % 3 === 0;
        case exports.Patterns.PATTERN110:
          return (i * j % 2 + i * j % 3) % 2 === 0;
        case exports.Patterns.PATTERN111:
          return (i * j % 3 + (i + j) % 2) % 2 === 0;
        default:
          throw new Error("bad maskPattern:" + maskPattern);
      }
    }
    __name(getMaskAt, "getMaskAt");
    exports.applyMask = /* @__PURE__ */ __name(function applyMask(pattern, data) {
      const size = data.size;
      for (let col = 0; col < size; col++) {
        for (let row = 0; row < size; row++) {
          if (data.isReserved(row, col)) continue;
          data.xor(row, col, getMaskAt(pattern, row, col));
        }
      }
    }, "applyMask");
    exports.getBestMask = /* @__PURE__ */ __name(function getBestMask(data, setupFormatFunc) {
      const numPatterns = Object.keys(exports.Patterns).length;
      let bestPattern = 0;
      let lowerPenalty = Infinity;
      for (let p = 0; p < numPatterns; p++) {
        setupFormatFunc(p);
        exports.applyMask(p, data);
        const penalty = exports.getPenaltyN1(data) + exports.getPenaltyN2(data) + exports.getPenaltyN3(data) + exports.getPenaltyN4(data);
        exports.applyMask(p, data);
        if (penalty < lowerPenalty) {
          lowerPenalty = penalty;
          bestPattern = p;
        }
      }
      return bestPattern;
    }, "getBestMask");
  }
});

// node_modules/qrcode/lib/core/error-correction-code.js
var require_error_correction_code = __commonJS({
  "node_modules/qrcode/lib/core/error-correction-code.js"(exports) {
    init_modules_watch_stub();
    var ECLevel = require_error_correction_level();
    var EC_BLOCKS_TABLE = [
      // L  M  Q  H
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      2,
      2,
      1,
      2,
      2,
      4,
      1,
      2,
      4,
      4,
      2,
      4,
      4,
      4,
      2,
      4,
      6,
      5,
      2,
      4,
      6,
      6,
      2,
      5,
      8,
      8,
      4,
      5,
      8,
      8,
      4,
      5,
      8,
      11,
      4,
      8,
      10,
      11,
      4,
      9,
      12,
      16,
      4,
      9,
      16,
      16,
      6,
      10,
      12,
      18,
      6,
      10,
      17,
      16,
      6,
      11,
      16,
      19,
      6,
      13,
      18,
      21,
      7,
      14,
      21,
      25,
      8,
      16,
      20,
      25,
      8,
      17,
      23,
      25,
      9,
      17,
      23,
      34,
      9,
      18,
      25,
      30,
      10,
      20,
      27,
      32,
      12,
      21,
      29,
      35,
      12,
      23,
      34,
      37,
      12,
      25,
      34,
      40,
      13,
      26,
      35,
      42,
      14,
      28,
      38,
      45,
      15,
      29,
      40,
      48,
      16,
      31,
      43,
      51,
      17,
      33,
      45,
      54,
      18,
      35,
      48,
      57,
      19,
      37,
      51,
      60,
      19,
      38,
      53,
      63,
      20,
      40,
      56,
      66,
      21,
      43,
      59,
      70,
      22,
      45,
      62,
      74,
      24,
      47,
      65,
      77,
      25,
      49,
      68,
      81
    ];
    var EC_CODEWORDS_TABLE = [
      // L  M  Q  H
      7,
      10,
      13,
      17,
      10,
      16,
      22,
      28,
      15,
      26,
      36,
      44,
      20,
      36,
      52,
      64,
      26,
      48,
      72,
      88,
      36,
      64,
      96,
      112,
      40,
      72,
      108,
      130,
      48,
      88,
      132,
      156,
      60,
      110,
      160,
      192,
      72,
      130,
      192,
      224,
      80,
      150,
      224,
      264,
      96,
      176,
      260,
      308,
      104,
      198,
      288,
      352,
      120,
      216,
      320,
      384,
      132,
      240,
      360,
      432,
      144,
      280,
      408,
      480,
      168,
      308,
      448,
      532,
      180,
      338,
      504,
      588,
      196,
      364,
      546,
      650,
      224,
      416,
      600,
      700,
      224,
      442,
      644,
      750,
      252,
      476,
      690,
      816,
      270,
      504,
      750,
      900,
      300,
      560,
      810,
      960,
      312,
      588,
      870,
      1050,
      336,
      644,
      952,
      1110,
      360,
      700,
      1020,
      1200,
      390,
      728,
      1050,
      1260,
      420,
      784,
      1140,
      1350,
      450,
      812,
      1200,
      1440,
      480,
      868,
      1290,
      1530,
      510,
      924,
      1350,
      1620,
      540,
      980,
      1440,
      1710,
      570,
      1036,
      1530,
      1800,
      570,
      1064,
      1590,
      1890,
      600,
      1120,
      1680,
      1980,
      630,
      1204,
      1770,
      2100,
      660,
      1260,
      1860,
      2220,
      720,
      1316,
      1950,
      2310,
      750,
      1372,
      2040,
      2430
    ];
    exports.getBlocksCount = /* @__PURE__ */ __name(function getBlocksCount(version, errorCorrectionLevel) {
      switch (errorCorrectionLevel) {
        case ECLevel.L:
          return EC_BLOCKS_TABLE[(version - 1) * 4 + 0];
        case ECLevel.M:
          return EC_BLOCKS_TABLE[(version - 1) * 4 + 1];
        case ECLevel.Q:
          return EC_BLOCKS_TABLE[(version - 1) * 4 + 2];
        case ECLevel.H:
          return EC_BLOCKS_TABLE[(version - 1) * 4 + 3];
        default:
          return void 0;
      }
    }, "getBlocksCount");
    exports.getTotalCodewordsCount = /* @__PURE__ */ __name(function getTotalCodewordsCount(version, errorCorrectionLevel) {
      switch (errorCorrectionLevel) {
        case ECLevel.L:
          return EC_CODEWORDS_TABLE[(version - 1) * 4 + 0];
        case ECLevel.M:
          return EC_CODEWORDS_TABLE[(version - 1) * 4 + 1];
        case ECLevel.Q:
          return EC_CODEWORDS_TABLE[(version - 1) * 4 + 2];
        case ECLevel.H:
          return EC_CODEWORDS_TABLE[(version - 1) * 4 + 3];
        default:
          return void 0;
      }
    }, "getTotalCodewordsCount");
  }
});

// node_modules/qrcode/lib/core/galois-field.js
var require_galois_field = __commonJS({
  "node_modules/qrcode/lib/core/galois-field.js"(exports) {
    init_modules_watch_stub();
    var EXP_TABLE = new Uint8Array(512);
    var LOG_TABLE = new Uint8Array(256);
    (/* @__PURE__ */ __name(function initTables() {
      let x = 1;
      for (let i = 0; i < 255; i++) {
        EXP_TABLE[i] = x;
        LOG_TABLE[x] = i;
        x <<= 1;
        if (x & 256) {
          x ^= 285;
        }
      }
      for (let i = 255; i < 512; i++) {
        EXP_TABLE[i] = EXP_TABLE[i - 255];
      }
    }, "initTables"))();
    exports.log = /* @__PURE__ */ __name(function log(n) {
      if (n < 1) throw new Error("log(" + n + ")");
      return LOG_TABLE[n];
    }, "log");
    exports.exp = /* @__PURE__ */ __name(function exp(n) {
      return EXP_TABLE[n];
    }, "exp");
    exports.mul = /* @__PURE__ */ __name(function mul(x, y) {
      if (x === 0 || y === 0) return 0;
      return EXP_TABLE[LOG_TABLE[x] + LOG_TABLE[y]];
    }, "mul");
  }
});

// node_modules/qrcode/lib/core/polynomial.js
var require_polynomial = __commonJS({
  "node_modules/qrcode/lib/core/polynomial.js"(exports) {
    init_modules_watch_stub();
    var GF = require_galois_field();
    exports.mul = /* @__PURE__ */ __name(function mul(p1, p2) {
      const coeff = new Uint8Array(p1.length + p2.length - 1);
      for (let i = 0; i < p1.length; i++) {
        for (let j = 0; j < p2.length; j++) {
          coeff[i + j] ^= GF.mul(p1[i], p2[j]);
        }
      }
      return coeff;
    }, "mul");
    exports.mod = /* @__PURE__ */ __name(function mod(divident, divisor) {
      let result = new Uint8Array(divident);
      while (result.length - divisor.length >= 0) {
        const coeff = result[0];
        for (let i = 0; i < divisor.length; i++) {
          result[i] ^= GF.mul(divisor[i], coeff);
        }
        let offset = 0;
        while (offset < result.length && result[offset] === 0) offset++;
        result = result.slice(offset);
      }
      return result;
    }, "mod");
    exports.generateECPolynomial = /* @__PURE__ */ __name(function generateECPolynomial(degree) {
      let poly = new Uint8Array([1]);
      for (let i = 0; i < degree; i++) {
        poly = exports.mul(poly, new Uint8Array([1, GF.exp(i)]));
      }
      return poly;
    }, "generateECPolynomial");
  }
});

// node_modules/qrcode/lib/core/reed-solomon-encoder.js
var require_reed_solomon_encoder = __commonJS({
  "node_modules/qrcode/lib/core/reed-solomon-encoder.js"(exports, module) {
    init_modules_watch_stub();
    var Polynomial = require_polynomial();
    function ReedSolomonEncoder(degree) {
      this.genPoly = void 0;
      this.degree = degree;
      if (this.degree) this.initialize(this.degree);
    }
    __name(ReedSolomonEncoder, "ReedSolomonEncoder");
    ReedSolomonEncoder.prototype.initialize = /* @__PURE__ */ __name(function initialize(degree) {
      this.degree = degree;
      this.genPoly = Polynomial.generateECPolynomial(this.degree);
    }, "initialize");
    ReedSolomonEncoder.prototype.encode = /* @__PURE__ */ __name(function encode(data) {
      if (!this.genPoly) {
        throw new Error("Encoder not initialized");
      }
      const paddedData = new Uint8Array(data.length + this.degree);
      paddedData.set(data);
      const remainder = Polynomial.mod(paddedData, this.genPoly);
      const start = this.degree - remainder.length;
      if (start > 0) {
        const buff = new Uint8Array(this.degree);
        buff.set(remainder, start);
        return buff;
      }
      return remainder;
    }, "encode");
    module.exports = ReedSolomonEncoder;
  }
});

// node_modules/qrcode/lib/core/version-check.js
var require_version_check = __commonJS({
  "node_modules/qrcode/lib/core/version-check.js"(exports) {
    init_modules_watch_stub();
    exports.isValid = /* @__PURE__ */ __name(function isValid(version) {
      return !isNaN(version) && version >= 1 && version <= 40;
    }, "isValid");
  }
});

// node_modules/qrcode/lib/core/regex.js
var require_regex = __commonJS({
  "node_modules/qrcode/lib/core/regex.js"(exports) {
    init_modules_watch_stub();
    var numeric = "[0-9]+";
    var alphanumeric = "[A-Z $%*+\\-./:]+";
    var kanji = "(?:[u3000-u303F]|[u3040-u309F]|[u30A0-u30FF]|[uFF00-uFFEF]|[u4E00-u9FAF]|[u2605-u2606]|[u2190-u2195]|u203B|[u2010u2015u2018u2019u2025u2026u201Cu201Du2225u2260]|[u0391-u0451]|[u00A7u00A8u00B1u00B4u00D7u00F7])+";
    kanji = kanji.replace(/u/g, "\\u");
    var byte = "(?:(?![A-Z0-9 $%*+\\-./:]|" + kanji + ")(?:.|[\r\n]))+";
    exports.KANJI = new RegExp(kanji, "g");
    exports.BYTE_KANJI = new RegExp("[^A-Z0-9 $%*+\\-./:]+", "g");
    exports.BYTE = new RegExp(byte, "g");
    exports.NUMERIC = new RegExp(numeric, "g");
    exports.ALPHANUMERIC = new RegExp(alphanumeric, "g");
    var TEST_KANJI = new RegExp("^" + kanji + "$");
    var TEST_NUMERIC = new RegExp("^" + numeric + "$");
    var TEST_ALPHANUMERIC = new RegExp("^[A-Z0-9 $%*+\\-./:]+$");
    exports.testKanji = /* @__PURE__ */ __name(function testKanji(str) {
      return TEST_KANJI.test(str);
    }, "testKanji");
    exports.testNumeric = /* @__PURE__ */ __name(function testNumeric(str) {
      return TEST_NUMERIC.test(str);
    }, "testNumeric");
    exports.testAlphanumeric = /* @__PURE__ */ __name(function testAlphanumeric(str) {
      return TEST_ALPHANUMERIC.test(str);
    }, "testAlphanumeric");
  }
});

// node_modules/qrcode/lib/core/mode.js
var require_mode = __commonJS({
  "node_modules/qrcode/lib/core/mode.js"(exports) {
    init_modules_watch_stub();
    var VersionCheck = require_version_check();
    var Regex = require_regex();
    exports.NUMERIC = {
      id: "Numeric",
      bit: 1 << 0,
      ccBits: [10, 12, 14]
    };
    exports.ALPHANUMERIC = {
      id: "Alphanumeric",
      bit: 1 << 1,
      ccBits: [9, 11, 13]
    };
    exports.BYTE = {
      id: "Byte",
      bit: 1 << 2,
      ccBits: [8, 16, 16]
    };
    exports.KANJI = {
      id: "Kanji",
      bit: 1 << 3,
      ccBits: [8, 10, 12]
    };
    exports.MIXED = {
      bit: -1
    };
    exports.getCharCountIndicator = /* @__PURE__ */ __name(function getCharCountIndicator(mode, version) {
      if (!mode.ccBits) throw new Error("Invalid mode: " + mode);
      if (!VersionCheck.isValid(version)) {
        throw new Error("Invalid version: " + version);
      }
      if (version >= 1 && version < 10) return mode.ccBits[0];
      else if (version < 27) return mode.ccBits[1];
      return mode.ccBits[2];
    }, "getCharCountIndicator");
    exports.getBestModeForData = /* @__PURE__ */ __name(function getBestModeForData(dataStr) {
      if (Regex.testNumeric(dataStr)) return exports.NUMERIC;
      else if (Regex.testAlphanumeric(dataStr)) return exports.ALPHANUMERIC;
      else if (Regex.testKanji(dataStr)) return exports.KANJI;
      else return exports.BYTE;
    }, "getBestModeForData");
    exports.toString = /* @__PURE__ */ __name(function toString(mode) {
      if (mode && mode.id) return mode.id;
      throw new Error("Invalid mode");
    }, "toString");
    exports.isValid = /* @__PURE__ */ __name(function isValid(mode) {
      return mode && mode.bit && mode.ccBits;
    }, "isValid");
    function fromString(string) {
      if (typeof string !== "string") {
        throw new Error("Param is not a string");
      }
      const lcStr = string.toLowerCase();
      switch (lcStr) {
        case "numeric":
          return exports.NUMERIC;
        case "alphanumeric":
          return exports.ALPHANUMERIC;
        case "kanji":
          return exports.KANJI;
        case "byte":
          return exports.BYTE;
        default:
          throw new Error("Unknown mode: " + string);
      }
    }
    __name(fromString, "fromString");
    exports.from = /* @__PURE__ */ __name(function from(value, defaultValue) {
      if (exports.isValid(value)) {
        return value;
      }
      try {
        return fromString(value);
      } catch (e) {
        return defaultValue;
      }
    }, "from");
  }
});

// node_modules/qrcode/lib/core/version.js
var require_version = __commonJS({
  "node_modules/qrcode/lib/core/version.js"(exports) {
    init_modules_watch_stub();
    var Utils = require_utils();
    var ECCode = require_error_correction_code();
    var ECLevel = require_error_correction_level();
    var Mode = require_mode();
    var VersionCheck = require_version_check();
    var G18 = 1 << 12 | 1 << 11 | 1 << 10 | 1 << 9 | 1 << 8 | 1 << 5 | 1 << 2 | 1 << 0;
    var G18_BCH = Utils.getBCHDigit(G18);
    function getBestVersionForDataLength(mode, length, errorCorrectionLevel) {
      for (let currentVersion = 1; currentVersion <= 40; currentVersion++) {
        if (length <= exports.getCapacity(currentVersion, errorCorrectionLevel, mode)) {
          return currentVersion;
        }
      }
      return void 0;
    }
    __name(getBestVersionForDataLength, "getBestVersionForDataLength");
    function getReservedBitsCount(mode, version) {
      return Mode.getCharCountIndicator(mode, version) + 4;
    }
    __name(getReservedBitsCount, "getReservedBitsCount");
    function getTotalBitsFromDataArray(segments, version) {
      let totalBits = 0;
      segments.forEach(function(data) {
        const reservedBits = getReservedBitsCount(data.mode, version);
        totalBits += reservedBits + data.getBitsLength();
      });
      return totalBits;
    }
    __name(getTotalBitsFromDataArray, "getTotalBitsFromDataArray");
    function getBestVersionForMixedData(segments, errorCorrectionLevel) {
      for (let currentVersion = 1; currentVersion <= 40; currentVersion++) {
        const length = getTotalBitsFromDataArray(segments, currentVersion);
        if (length <= exports.getCapacity(currentVersion, errorCorrectionLevel, Mode.MIXED)) {
          return currentVersion;
        }
      }
      return void 0;
    }
    __name(getBestVersionForMixedData, "getBestVersionForMixedData");
    exports.from = /* @__PURE__ */ __name(function from(value, defaultValue) {
      if (VersionCheck.isValid(value)) {
        return parseInt(value, 10);
      }
      return defaultValue;
    }, "from");
    exports.getCapacity = /* @__PURE__ */ __name(function getCapacity(version, errorCorrectionLevel, mode) {
      if (!VersionCheck.isValid(version)) {
        throw new Error("Invalid QR Code version");
      }
      if (typeof mode === "undefined") mode = Mode.BYTE;
      const totalCodewords = Utils.getSymbolTotalCodewords(version);
      const ecTotalCodewords = ECCode.getTotalCodewordsCount(version, errorCorrectionLevel);
      const dataTotalCodewordsBits = (totalCodewords - ecTotalCodewords) * 8;
      if (mode === Mode.MIXED) return dataTotalCodewordsBits;
      const usableBits = dataTotalCodewordsBits - getReservedBitsCount(mode, version);
      switch (mode) {
        case Mode.NUMERIC:
          return Math.floor(usableBits / 10 * 3);
        case Mode.ALPHANUMERIC:
          return Math.floor(usableBits / 11 * 2);
        case Mode.KANJI:
          return Math.floor(usableBits / 13);
        case Mode.BYTE:
        default:
          return Math.floor(usableBits / 8);
      }
    }, "getCapacity");
    exports.getBestVersionForData = /* @__PURE__ */ __name(function getBestVersionForData(data, errorCorrectionLevel) {
      let seg;
      const ecl = ECLevel.from(errorCorrectionLevel, ECLevel.M);
      if (Array.isArray(data)) {
        if (data.length > 1) {
          return getBestVersionForMixedData(data, ecl);
        }
        if (data.length === 0) {
          return 1;
        }
        seg = data[0];
      } else {
        seg = data;
      }
      return getBestVersionForDataLength(seg.mode, seg.getLength(), ecl);
    }, "getBestVersionForData");
    exports.getEncodedBits = /* @__PURE__ */ __name(function getEncodedBits(version) {
      if (!VersionCheck.isValid(version) || version < 7) {
        throw new Error("Invalid QR Code version");
      }
      let d = version << 12;
      while (Utils.getBCHDigit(d) - G18_BCH >= 0) {
        d ^= G18 << Utils.getBCHDigit(d) - G18_BCH;
      }
      return version << 12 | d;
    }, "getEncodedBits");
  }
});

// node_modules/qrcode/lib/core/format-info.js
var require_format_info = __commonJS({
  "node_modules/qrcode/lib/core/format-info.js"(exports) {
    init_modules_watch_stub();
    var Utils = require_utils();
    var G15 = 1 << 10 | 1 << 8 | 1 << 5 | 1 << 4 | 1 << 2 | 1 << 1 | 1 << 0;
    var G15_MASK = 1 << 14 | 1 << 12 | 1 << 10 | 1 << 4 | 1 << 1;
    var G15_BCH = Utils.getBCHDigit(G15);
    exports.getEncodedBits = /* @__PURE__ */ __name(function getEncodedBits(errorCorrectionLevel, mask) {
      const data = errorCorrectionLevel.bit << 3 | mask;
      let d = data << 10;
      while (Utils.getBCHDigit(d) - G15_BCH >= 0) {
        d ^= G15 << Utils.getBCHDigit(d) - G15_BCH;
      }
      return (data << 10 | d) ^ G15_MASK;
    }, "getEncodedBits");
  }
});

// node_modules/qrcode/lib/core/numeric-data.js
var require_numeric_data = __commonJS({
  "node_modules/qrcode/lib/core/numeric-data.js"(exports, module) {
    init_modules_watch_stub();
    var Mode = require_mode();
    function NumericData(data) {
      this.mode = Mode.NUMERIC;
      this.data = data.toString();
    }
    __name(NumericData, "NumericData");
    NumericData.getBitsLength = /* @__PURE__ */ __name(function getBitsLength(length) {
      return 10 * Math.floor(length / 3) + (length % 3 ? length % 3 * 3 + 1 : 0);
    }, "getBitsLength");
    NumericData.prototype.getLength = /* @__PURE__ */ __name(function getLength() {
      return this.data.length;
    }, "getLength");
    NumericData.prototype.getBitsLength = /* @__PURE__ */ __name(function getBitsLength() {
      return NumericData.getBitsLength(this.data.length);
    }, "getBitsLength");
    NumericData.prototype.write = /* @__PURE__ */ __name(function write(bitBuffer) {
      let i, group, value;
      for (i = 0; i + 3 <= this.data.length; i += 3) {
        group = this.data.substr(i, 3);
        value = parseInt(group, 10);
        bitBuffer.put(value, 10);
      }
      const remainingNum = this.data.length - i;
      if (remainingNum > 0) {
        group = this.data.substr(i);
        value = parseInt(group, 10);
        bitBuffer.put(value, remainingNum * 3 + 1);
      }
    }, "write");
    module.exports = NumericData;
  }
});

// node_modules/qrcode/lib/core/alphanumeric-data.js
var require_alphanumeric_data = __commonJS({
  "node_modules/qrcode/lib/core/alphanumeric-data.js"(exports, module) {
    init_modules_watch_stub();
    var Mode = require_mode();
    var ALPHA_NUM_CHARS = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z",
      " ",
      "$",
      "%",
      "*",
      "+",
      "-",
      ".",
      "/",
      ":"
    ];
    function AlphanumericData(data) {
      this.mode = Mode.ALPHANUMERIC;
      this.data = data;
    }
    __name(AlphanumericData, "AlphanumericData");
    AlphanumericData.getBitsLength = /* @__PURE__ */ __name(function getBitsLength(length) {
      return 11 * Math.floor(length / 2) + 6 * (length % 2);
    }, "getBitsLength");
    AlphanumericData.prototype.getLength = /* @__PURE__ */ __name(function getLength() {
      return this.data.length;
    }, "getLength");
    AlphanumericData.prototype.getBitsLength = /* @__PURE__ */ __name(function getBitsLength() {
      return AlphanumericData.getBitsLength(this.data.length);
    }, "getBitsLength");
    AlphanumericData.prototype.write = /* @__PURE__ */ __name(function write(bitBuffer) {
      let i;
      for (i = 0; i + 2 <= this.data.length; i += 2) {
        let value = ALPHA_NUM_CHARS.indexOf(this.data[i]) * 45;
        value += ALPHA_NUM_CHARS.indexOf(this.data[i + 1]);
        bitBuffer.put(value, 11);
      }
      if (this.data.length % 2) {
        bitBuffer.put(ALPHA_NUM_CHARS.indexOf(this.data[i]), 6);
      }
    }, "write");
    module.exports = AlphanumericData;
  }
});

// node_modules/qrcode/lib/core/byte-data.js
var require_byte_data = __commonJS({
  "node_modules/qrcode/lib/core/byte-data.js"(exports, module) {
    init_modules_watch_stub();
    var Mode = require_mode();
    function ByteData(data) {
      this.mode = Mode.BYTE;
      if (typeof data === "string") {
        this.data = new TextEncoder().encode(data);
      } else {
        this.data = new Uint8Array(data);
      }
    }
    __name(ByteData, "ByteData");
    ByteData.getBitsLength = /* @__PURE__ */ __name(function getBitsLength(length) {
      return length * 8;
    }, "getBitsLength");
    ByteData.prototype.getLength = /* @__PURE__ */ __name(function getLength() {
      return this.data.length;
    }, "getLength");
    ByteData.prototype.getBitsLength = /* @__PURE__ */ __name(function getBitsLength() {
      return ByteData.getBitsLength(this.data.length);
    }, "getBitsLength");
    ByteData.prototype.write = function(bitBuffer) {
      for (let i = 0, l = this.data.length; i < l; i++) {
        bitBuffer.put(this.data[i], 8);
      }
    };
    module.exports = ByteData;
  }
});

// node_modules/qrcode/lib/core/kanji-data.js
var require_kanji_data = __commonJS({
  "node_modules/qrcode/lib/core/kanji-data.js"(exports, module) {
    init_modules_watch_stub();
    var Mode = require_mode();
    var Utils = require_utils();
    function KanjiData(data) {
      this.mode = Mode.KANJI;
      this.data = data;
    }
    __name(KanjiData, "KanjiData");
    KanjiData.getBitsLength = /* @__PURE__ */ __name(function getBitsLength(length) {
      return length * 13;
    }, "getBitsLength");
    KanjiData.prototype.getLength = /* @__PURE__ */ __name(function getLength() {
      return this.data.length;
    }, "getLength");
    KanjiData.prototype.getBitsLength = /* @__PURE__ */ __name(function getBitsLength() {
      return KanjiData.getBitsLength(this.data.length);
    }, "getBitsLength");
    KanjiData.prototype.write = function(bitBuffer) {
      let i;
      for (i = 0; i < this.data.length; i++) {
        let value = Utils.toSJIS(this.data[i]);
        if (value >= 33088 && value <= 40956) {
          value -= 33088;
        } else if (value >= 57408 && value <= 60351) {
          value -= 49472;
        } else {
          throw new Error(
            "Invalid SJIS character: " + this.data[i] + "\nMake sure your charset is UTF-8"
          );
        }
        value = (value >>> 8 & 255) * 192 + (value & 255);
        bitBuffer.put(value, 13);
      }
    };
    module.exports = KanjiData;
  }
});

// node_modules/dijkstrajs/dijkstra.js
var require_dijkstra = __commonJS({
  "node_modules/dijkstrajs/dijkstra.js"(exports, module) {
    "use strict";
    init_modules_watch_stub();
    var dijkstra = {
      single_source_shortest_paths: /* @__PURE__ */ __name(function(graph, s, d) {
        var predecessors = {};
        var costs = {};
        costs[s] = 0;
        var open = dijkstra.PriorityQueue.make();
        open.push(s, 0);
        var closest, u, v, cost_of_s_to_u, adjacent_nodes, cost_of_e, cost_of_s_to_u_plus_cost_of_e, cost_of_s_to_v, first_visit;
        while (!open.empty()) {
          closest = open.pop();
          u = closest.value;
          cost_of_s_to_u = closest.cost;
          adjacent_nodes = graph[u] || {};
          for (v in adjacent_nodes) {
            if (adjacent_nodes.hasOwnProperty(v)) {
              cost_of_e = adjacent_nodes[v];
              cost_of_s_to_u_plus_cost_of_e = cost_of_s_to_u + cost_of_e;
              cost_of_s_to_v = costs[v];
              first_visit = typeof costs[v] === "undefined";
              if (first_visit || cost_of_s_to_v > cost_of_s_to_u_plus_cost_of_e) {
                costs[v] = cost_of_s_to_u_plus_cost_of_e;
                open.push(v, cost_of_s_to_u_plus_cost_of_e);
                predecessors[v] = u;
              }
            }
          }
        }
        if (typeof d !== "undefined" && typeof costs[d] === "undefined") {
          var msg = ["Could not find a path from ", s, " to ", d, "."].join("");
          throw new Error(msg);
        }
        return predecessors;
      }, "single_source_shortest_paths"),
      extract_shortest_path_from_predecessor_list: /* @__PURE__ */ __name(function(predecessors, d) {
        var nodes = [];
        var u = d;
        var predecessor;
        while (u) {
          nodes.push(u);
          predecessor = predecessors[u];
          u = predecessors[u];
        }
        nodes.reverse();
        return nodes;
      }, "extract_shortest_path_from_predecessor_list"),
      find_path: /* @__PURE__ */ __name(function(graph, s, d) {
        var predecessors = dijkstra.single_source_shortest_paths(graph, s, d);
        return dijkstra.extract_shortest_path_from_predecessor_list(
          predecessors,
          d
        );
      }, "find_path"),
      /**
       * A very naive priority queue implementation.
       */
      PriorityQueue: {
        make: /* @__PURE__ */ __name(function(opts) {
          var T = dijkstra.PriorityQueue, t = {}, key;
          opts = opts || {};
          for (key in T) {
            if (T.hasOwnProperty(key)) {
              t[key] = T[key];
            }
          }
          t.queue = [];
          t.sorter = opts.sorter || T.default_sorter;
          return t;
        }, "make"),
        default_sorter: /* @__PURE__ */ __name(function(a, b) {
          return a.cost - b.cost;
        }, "default_sorter"),
        /**
         * Add a new item to the queue and ensure the highest priority element
         * is at the front of the queue.
         */
        push: /* @__PURE__ */ __name(function(value, cost) {
          var item = { value, cost };
          this.queue.push(item);
          this.queue.sort(this.sorter);
        }, "push"),
        /**
         * Return the highest priority element in the queue.
         */
        pop: /* @__PURE__ */ __name(function() {
          return this.queue.shift();
        }, "pop"),
        empty: /* @__PURE__ */ __name(function() {
          return this.queue.length === 0;
        }, "empty")
      }
    };
    if (typeof module !== "undefined") {
      module.exports = dijkstra;
    }
  }
});

// node_modules/qrcode/lib/core/segments.js
var require_segments = __commonJS({
  "node_modules/qrcode/lib/core/segments.js"(exports) {
    init_modules_watch_stub();
    var Mode = require_mode();
    var NumericData = require_numeric_data();
    var AlphanumericData = require_alphanumeric_data();
    var ByteData = require_byte_data();
    var KanjiData = require_kanji_data();
    var Regex = require_regex();
    var Utils = require_utils();
    var dijkstra = require_dijkstra();
    function getStringByteLength(str) {
      return unescape(encodeURIComponent(str)).length;
    }
    __name(getStringByteLength, "getStringByteLength");
    function getSegments(regex, mode, str) {
      const segments = [];
      let result;
      while ((result = regex.exec(str)) !== null) {
        segments.push({
          data: result[0],
          index: result.index,
          mode,
          length: result[0].length
        });
      }
      return segments;
    }
    __name(getSegments, "getSegments");
    function getSegmentsFromString(dataStr) {
      const numSegs = getSegments(Regex.NUMERIC, Mode.NUMERIC, dataStr);
      const alphaNumSegs = getSegments(Regex.ALPHANUMERIC, Mode.ALPHANUMERIC, dataStr);
      let byteSegs;
      let kanjiSegs;
      if (Utils.isKanjiModeEnabled()) {
        byteSegs = getSegments(Regex.BYTE, Mode.BYTE, dataStr);
        kanjiSegs = getSegments(Regex.KANJI, Mode.KANJI, dataStr);
      } else {
        byteSegs = getSegments(Regex.BYTE_KANJI, Mode.BYTE, dataStr);
        kanjiSegs = [];
      }
      const segs = numSegs.concat(alphaNumSegs, byteSegs, kanjiSegs);
      return segs.sort(function(s1, s2) {
        return s1.index - s2.index;
      }).map(function(obj) {
        return {
          data: obj.data,
          mode: obj.mode,
          length: obj.length
        };
      });
    }
    __name(getSegmentsFromString, "getSegmentsFromString");
    function getSegmentBitsLength(length, mode) {
      switch (mode) {
        case Mode.NUMERIC:
          return NumericData.getBitsLength(length);
        case Mode.ALPHANUMERIC:
          return AlphanumericData.getBitsLength(length);
        case Mode.KANJI:
          return KanjiData.getBitsLength(length);
        case Mode.BYTE:
          return ByteData.getBitsLength(length);
      }
    }
    __name(getSegmentBitsLength, "getSegmentBitsLength");
    function mergeSegments(segs) {
      return segs.reduce(function(acc, curr) {
        const prevSeg = acc.length - 1 >= 0 ? acc[acc.length - 1] : null;
        if (prevSeg && prevSeg.mode === curr.mode) {
          acc[acc.length - 1].data += curr.data;
          return acc;
        }
        acc.push(curr);
        return acc;
      }, []);
    }
    __name(mergeSegments, "mergeSegments");
    function buildNodes(segs) {
      const nodes = [];
      for (let i = 0; i < segs.length; i++) {
        const seg = segs[i];
        switch (seg.mode) {
          case Mode.NUMERIC:
            nodes.push([
              seg,
              { data: seg.data, mode: Mode.ALPHANUMERIC, length: seg.length },
              { data: seg.data, mode: Mode.BYTE, length: seg.length }
            ]);
            break;
          case Mode.ALPHANUMERIC:
            nodes.push([
              seg,
              { data: seg.data, mode: Mode.BYTE, length: seg.length }
            ]);
            break;
          case Mode.KANJI:
            nodes.push([
              seg,
              { data: seg.data, mode: Mode.BYTE, length: getStringByteLength(seg.data) }
            ]);
            break;
          case Mode.BYTE:
            nodes.push([
              { data: seg.data, mode: Mode.BYTE, length: getStringByteLength(seg.data) }
            ]);
        }
      }
      return nodes;
    }
    __name(buildNodes, "buildNodes");
    function buildGraph(nodes, version) {
      const table = {};
      const graph = { start: {} };
      let prevNodeIds = ["start"];
      for (let i = 0; i < nodes.length; i++) {
        const nodeGroup = nodes[i];
        const currentNodeIds = [];
        for (let j = 0; j < nodeGroup.length; j++) {
          const node = nodeGroup[j];
          const key = "" + i + j;
          currentNodeIds.push(key);
          table[key] = { node, lastCount: 0 };
          graph[key] = {};
          for (let n = 0; n < prevNodeIds.length; n++) {
            const prevNodeId = prevNodeIds[n];
            if (table[prevNodeId] && table[prevNodeId].node.mode === node.mode) {
              graph[prevNodeId][key] = getSegmentBitsLength(table[prevNodeId].lastCount + node.length, node.mode) - getSegmentBitsLength(table[prevNodeId].lastCount, node.mode);
              table[prevNodeId].lastCount += node.length;
            } else {
              if (table[prevNodeId]) table[prevNodeId].lastCount = node.length;
              graph[prevNodeId][key] = getSegmentBitsLength(node.length, node.mode) + 4 + Mode.getCharCountIndicator(node.mode, version);
            }
          }
        }
        prevNodeIds = currentNodeIds;
      }
      for (let n = 0; n < prevNodeIds.length; n++) {
        graph[prevNodeIds[n]].end = 0;
      }
      return { map: graph, table };
    }
    __name(buildGraph, "buildGraph");
    function buildSingleSegment(data, modesHint) {
      let mode;
      const bestMode = Mode.getBestModeForData(data);
      mode = Mode.from(modesHint, bestMode);
      if (mode !== Mode.BYTE && mode.bit < bestMode.bit) {
        throw new Error('"' + data + '" cannot be encoded with mode ' + Mode.toString(mode) + ".\n Suggested mode is: " + Mode.toString(bestMode));
      }
      if (mode === Mode.KANJI && !Utils.isKanjiModeEnabled()) {
        mode = Mode.BYTE;
      }
      switch (mode) {
        case Mode.NUMERIC:
          return new NumericData(data);
        case Mode.ALPHANUMERIC:
          return new AlphanumericData(data);
        case Mode.KANJI:
          return new KanjiData(data);
        case Mode.BYTE:
          return new ByteData(data);
      }
    }
    __name(buildSingleSegment, "buildSingleSegment");
    exports.fromArray = /* @__PURE__ */ __name(function fromArray(array) {
      return array.reduce(function(acc, seg) {
        if (typeof seg === "string") {
          acc.push(buildSingleSegment(seg, null));
        } else if (seg.data) {
          acc.push(buildSingleSegment(seg.data, seg.mode));
        }
        return acc;
      }, []);
    }, "fromArray");
    exports.fromString = /* @__PURE__ */ __name(function fromString(data, version) {
      const segs = getSegmentsFromString(data, Utils.isKanjiModeEnabled());
      const nodes = buildNodes(segs);
      const graph = buildGraph(nodes, version);
      const path = dijkstra.find_path(graph.map, "start", "end");
      const optimizedSegs = [];
      for (let i = 1; i < path.length - 1; i++) {
        optimizedSegs.push(graph.table[path[i]].node);
      }
      return exports.fromArray(mergeSegments(optimizedSegs));
    }, "fromString");
    exports.rawSplit = /* @__PURE__ */ __name(function rawSplit(data) {
      return exports.fromArray(
        getSegmentsFromString(data, Utils.isKanjiModeEnabled())
      );
    }, "rawSplit");
  }
});

// node_modules/qrcode/lib/core/qrcode.js
var require_qrcode = __commonJS({
  "node_modules/qrcode/lib/core/qrcode.js"(exports) {
    init_modules_watch_stub();
    var Utils = require_utils();
    var ECLevel = require_error_correction_level();
    var BitBuffer = require_bit_buffer();
    var BitMatrix = require_bit_matrix();
    var AlignmentPattern = require_alignment_pattern();
    var FinderPattern = require_finder_pattern();
    var MaskPattern = require_mask_pattern();
    var ECCode = require_error_correction_code();
    var ReedSolomonEncoder = require_reed_solomon_encoder();
    var Version = require_version();
    var FormatInfo = require_format_info();
    var Mode = require_mode();
    var Segments = require_segments();
    function setupFinderPattern(matrix, version) {
      const size = matrix.size;
      const pos = FinderPattern.getPositions(version);
      for (let i = 0; i < pos.length; i++) {
        const row = pos[i][0];
        const col = pos[i][1];
        for (let r = -1; r <= 7; r++) {
          if (row + r <= -1 || size <= row + r) continue;
          for (let c = -1; c <= 7; c++) {
            if (col + c <= -1 || size <= col + c) continue;
            if (r >= 0 && r <= 6 && (c === 0 || c === 6) || c >= 0 && c <= 6 && (r === 0 || r === 6) || r >= 2 && r <= 4 && c >= 2 && c <= 4) {
              matrix.set(row + r, col + c, true, true);
            } else {
              matrix.set(row + r, col + c, false, true);
            }
          }
        }
      }
    }
    __name(setupFinderPattern, "setupFinderPattern");
    function setupTimingPattern(matrix) {
      const size = matrix.size;
      for (let r = 8; r < size - 8; r++) {
        const value = r % 2 === 0;
        matrix.set(r, 6, value, true);
        matrix.set(6, r, value, true);
      }
    }
    __name(setupTimingPattern, "setupTimingPattern");
    function setupAlignmentPattern(matrix, version) {
      const pos = AlignmentPattern.getPositions(version);
      for (let i = 0; i < pos.length; i++) {
        const row = pos[i][0];
        const col = pos[i][1];
        for (let r = -2; r <= 2; r++) {
          for (let c = -2; c <= 2; c++) {
            if (r === -2 || r === 2 || c === -2 || c === 2 || r === 0 && c === 0) {
              matrix.set(row + r, col + c, true, true);
            } else {
              matrix.set(row + r, col + c, false, true);
            }
          }
        }
      }
    }
    __name(setupAlignmentPattern, "setupAlignmentPattern");
    function setupVersionInfo(matrix, version) {
      const size = matrix.size;
      const bits = Version.getEncodedBits(version);
      let row, col, mod;
      for (let i = 0; i < 18; i++) {
        row = Math.floor(i / 3);
        col = i % 3 + size - 8 - 3;
        mod = (bits >> i & 1) === 1;
        matrix.set(row, col, mod, true);
        matrix.set(col, row, mod, true);
      }
    }
    __name(setupVersionInfo, "setupVersionInfo");
    function setupFormatInfo(matrix, errorCorrectionLevel, maskPattern) {
      const size = matrix.size;
      const bits = FormatInfo.getEncodedBits(errorCorrectionLevel, maskPattern);
      let i, mod;
      for (i = 0; i < 15; i++) {
        mod = (bits >> i & 1) === 1;
        if (i < 6) {
          matrix.set(i, 8, mod, true);
        } else if (i < 8) {
          matrix.set(i + 1, 8, mod, true);
        } else {
          matrix.set(size - 15 + i, 8, mod, true);
        }
        if (i < 8) {
          matrix.set(8, size - i - 1, mod, true);
        } else if (i < 9) {
          matrix.set(8, 15 - i - 1 + 1, mod, true);
        } else {
          matrix.set(8, 15 - i - 1, mod, true);
        }
      }
      matrix.set(size - 8, 8, 1, true);
    }
    __name(setupFormatInfo, "setupFormatInfo");
    function setupData(matrix, data) {
      const size = matrix.size;
      let inc = -1;
      let row = size - 1;
      let bitIndex = 7;
      let byteIndex = 0;
      for (let col = size - 1; col > 0; col -= 2) {
        if (col === 6) col--;
        while (true) {
          for (let c = 0; c < 2; c++) {
            if (!matrix.isReserved(row, col - c)) {
              let dark = false;
              if (byteIndex < data.length) {
                dark = (data[byteIndex] >>> bitIndex & 1) === 1;
              }
              matrix.set(row, col - c, dark);
              bitIndex--;
              if (bitIndex === -1) {
                byteIndex++;
                bitIndex = 7;
              }
            }
          }
          row += inc;
          if (row < 0 || size <= row) {
            row -= inc;
            inc = -inc;
            break;
          }
        }
      }
    }
    __name(setupData, "setupData");
    function createData(version, errorCorrectionLevel, segments) {
      const buffer = new BitBuffer();
      segments.forEach(function(data) {
        buffer.put(data.mode.bit, 4);
        buffer.put(data.getLength(), Mode.getCharCountIndicator(data.mode, version));
        data.write(buffer);
      });
      const totalCodewords = Utils.getSymbolTotalCodewords(version);
      const ecTotalCodewords = ECCode.getTotalCodewordsCount(version, errorCorrectionLevel);
      const dataTotalCodewordsBits = (totalCodewords - ecTotalCodewords) * 8;
      if (buffer.getLengthInBits() + 4 <= dataTotalCodewordsBits) {
        buffer.put(0, 4);
      }
      while (buffer.getLengthInBits() % 8 !== 0) {
        buffer.putBit(0);
      }
      const remainingByte = (dataTotalCodewordsBits - buffer.getLengthInBits()) / 8;
      for (let i = 0; i < remainingByte; i++) {
        buffer.put(i % 2 ? 17 : 236, 8);
      }
      return createCodewords(buffer, version, errorCorrectionLevel);
    }
    __name(createData, "createData");
    function createCodewords(bitBuffer, version, errorCorrectionLevel) {
      const totalCodewords = Utils.getSymbolTotalCodewords(version);
      const ecTotalCodewords = ECCode.getTotalCodewordsCount(version, errorCorrectionLevel);
      const dataTotalCodewords = totalCodewords - ecTotalCodewords;
      const ecTotalBlocks = ECCode.getBlocksCount(version, errorCorrectionLevel);
      const blocksInGroup2 = totalCodewords % ecTotalBlocks;
      const blocksInGroup1 = ecTotalBlocks - blocksInGroup2;
      const totalCodewordsInGroup1 = Math.floor(totalCodewords / ecTotalBlocks);
      const dataCodewordsInGroup1 = Math.floor(dataTotalCodewords / ecTotalBlocks);
      const dataCodewordsInGroup2 = dataCodewordsInGroup1 + 1;
      const ecCount = totalCodewordsInGroup1 - dataCodewordsInGroup1;
      const rs = new ReedSolomonEncoder(ecCount);
      let offset = 0;
      const dcData = new Array(ecTotalBlocks);
      const ecData = new Array(ecTotalBlocks);
      let maxDataSize = 0;
      const buffer = new Uint8Array(bitBuffer.buffer);
      for (let b = 0; b < ecTotalBlocks; b++) {
        const dataSize = b < blocksInGroup1 ? dataCodewordsInGroup1 : dataCodewordsInGroup2;
        dcData[b] = buffer.slice(offset, offset + dataSize);
        ecData[b] = rs.encode(dcData[b]);
        offset += dataSize;
        maxDataSize = Math.max(maxDataSize, dataSize);
      }
      const data = new Uint8Array(totalCodewords);
      let index = 0;
      let i, r;
      for (i = 0; i < maxDataSize; i++) {
        for (r = 0; r < ecTotalBlocks; r++) {
          if (i < dcData[r].length) {
            data[index++] = dcData[r][i];
          }
        }
      }
      for (i = 0; i < ecCount; i++) {
        for (r = 0; r < ecTotalBlocks; r++) {
          data[index++] = ecData[r][i];
        }
      }
      return data;
    }
    __name(createCodewords, "createCodewords");
    function createSymbol(data, version, errorCorrectionLevel, maskPattern) {
      let segments;
      if (Array.isArray(data)) {
        segments = Segments.fromArray(data);
      } else if (typeof data === "string") {
        let estimatedVersion = version;
        if (!estimatedVersion) {
          const rawSegments = Segments.rawSplit(data);
          estimatedVersion = Version.getBestVersionForData(rawSegments, errorCorrectionLevel);
        }
        segments = Segments.fromString(data, estimatedVersion || 40);
      } else {
        throw new Error("Invalid data");
      }
      const bestVersion = Version.getBestVersionForData(segments, errorCorrectionLevel);
      if (!bestVersion) {
        throw new Error("The amount of data is too big to be stored in a QR Code");
      }
      if (!version) {
        version = bestVersion;
      } else if (version < bestVersion) {
        throw new Error(
          "\nThe chosen QR Code version cannot contain this amount of data.\nMinimum version required to store current data is: " + bestVersion + ".\n"
        );
      }
      const dataBits = createData(version, errorCorrectionLevel, segments);
      const moduleCount = Utils.getSymbolSize(version);
      const modules = new BitMatrix(moduleCount);
      setupFinderPattern(modules, version);
      setupTimingPattern(modules);
      setupAlignmentPattern(modules, version);
      setupFormatInfo(modules, errorCorrectionLevel, 0);
      if (version >= 7) {
        setupVersionInfo(modules, version);
      }
      setupData(modules, dataBits);
      if (isNaN(maskPattern)) {
        maskPattern = MaskPattern.getBestMask(
          modules,
          setupFormatInfo.bind(null, modules, errorCorrectionLevel)
        );
      }
      MaskPattern.applyMask(maskPattern, modules);
      setupFormatInfo(modules, errorCorrectionLevel, maskPattern);
      return {
        modules,
        version,
        errorCorrectionLevel,
        maskPattern,
        segments
      };
    }
    __name(createSymbol, "createSymbol");
    exports.create = /* @__PURE__ */ __name(function create(data, options) {
      if (typeof data === "undefined" || data === "") {
        throw new Error("No input text");
      }
      let errorCorrectionLevel = ECLevel.M;
      let version;
      let mask;
      if (typeof options !== "undefined") {
        errorCorrectionLevel = ECLevel.from(options.errorCorrectionLevel, ECLevel.M);
        version = Version.from(options.version);
        mask = MaskPattern.from(options.maskPattern);
        if (options.toSJISFunc) {
          Utils.setToSJISFunction(options.toSJISFunc);
        }
      }
      return createSymbol(data, version, errorCorrectionLevel, mask);
    }, "create");
  }
});

// node_modules/qrcode/lib/renderer/utils.js
var require_utils2 = __commonJS({
  "node_modules/qrcode/lib/renderer/utils.js"(exports) {
    init_modules_watch_stub();
    function hex2rgba(hex) {
      if (typeof hex === "number") {
        hex = hex.toString();
      }
      if (typeof hex !== "string") {
        throw new Error("Color should be defined as hex string");
      }
      let hexCode = hex.slice().replace("#", "").split("");
      if (hexCode.length < 3 || hexCode.length === 5 || hexCode.length > 8) {
        throw new Error("Invalid hex color: " + hex);
      }
      if (hexCode.length === 3 || hexCode.length === 4) {
        hexCode = Array.prototype.concat.apply([], hexCode.map(function(c) {
          return [c, c];
        }));
      }
      if (hexCode.length === 6) hexCode.push("F", "F");
      const hexValue = parseInt(hexCode.join(""), 16);
      return {
        r: hexValue >> 24 & 255,
        g: hexValue >> 16 & 255,
        b: hexValue >> 8 & 255,
        a: hexValue & 255,
        hex: "#" + hexCode.slice(0, 6).join("")
      };
    }
    __name(hex2rgba, "hex2rgba");
    exports.getOptions = /* @__PURE__ */ __name(function getOptions(options) {
      if (!options) options = {};
      if (!options.color) options.color = {};
      const margin = typeof options.margin === "undefined" || options.margin === null || options.margin < 0 ? 4 : options.margin;
      const width = options.width && options.width >= 21 ? options.width : void 0;
      const scale = options.scale || 4;
      return {
        width,
        scale: width ? 4 : scale,
        margin,
        color: {
          dark: hex2rgba(options.color.dark || "#000000ff"),
          light: hex2rgba(options.color.light || "#ffffffff")
        },
        type: options.type,
        rendererOpts: options.rendererOpts || {}
      };
    }, "getOptions");
    exports.getScale = /* @__PURE__ */ __name(function getScale(qrSize, opts) {
      return opts.width && opts.width >= qrSize + opts.margin * 2 ? opts.width / (qrSize + opts.margin * 2) : opts.scale;
    }, "getScale");
    exports.getImageWidth = /* @__PURE__ */ __name(function getImageWidth(qrSize, opts) {
      const scale = exports.getScale(qrSize, opts);
      return Math.floor((qrSize + opts.margin * 2) * scale);
    }, "getImageWidth");
    exports.qrToImageData = /* @__PURE__ */ __name(function qrToImageData(imgData, qr, opts) {
      const size = qr.modules.size;
      const data = qr.modules.data;
      const scale = exports.getScale(size, opts);
      const symbolSize = Math.floor((size + opts.margin * 2) * scale);
      const scaledMargin = opts.margin * scale;
      const palette = [opts.color.light, opts.color.dark];
      for (let i = 0; i < symbolSize; i++) {
        for (let j = 0; j < symbolSize; j++) {
          let posDst = (i * symbolSize + j) * 4;
          let pxColor = opts.color.light;
          if (i >= scaledMargin && j >= scaledMargin && i < symbolSize - scaledMargin && j < symbolSize - scaledMargin) {
            const iSrc = Math.floor((i - scaledMargin) / scale);
            const jSrc = Math.floor((j - scaledMargin) / scale);
            pxColor = palette[data[iSrc * size + jSrc] ? 1 : 0];
          }
          imgData[posDst++] = pxColor.r;
          imgData[posDst++] = pxColor.g;
          imgData[posDst++] = pxColor.b;
          imgData[posDst] = pxColor.a;
        }
      }
    }, "qrToImageData");
  }
});

// node_modules/qrcode/lib/renderer/canvas.js
var require_canvas = __commonJS({
  "node_modules/qrcode/lib/renderer/canvas.js"(exports) {
    init_modules_watch_stub();
    var Utils = require_utils2();
    function clearCanvas(ctx, canvas, size) {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      if (!canvas.style) canvas.style = {};
      canvas.height = size;
      canvas.width = size;
      canvas.style.height = size + "px";
      canvas.style.width = size + "px";
    }
    __name(clearCanvas, "clearCanvas");
    function getCanvasElement() {
      try {
        return document.createElement("canvas");
      } catch (e) {
        throw new Error("You need to specify a canvas element");
      }
    }
    __name(getCanvasElement, "getCanvasElement");
    exports.render = /* @__PURE__ */ __name(function render(qrData, canvas, options) {
      let opts = options;
      let canvasEl = canvas;
      if (typeof opts === "undefined" && (!canvas || !canvas.getContext)) {
        opts = canvas;
        canvas = void 0;
      }
      if (!canvas) {
        canvasEl = getCanvasElement();
      }
      opts = Utils.getOptions(opts);
      const size = Utils.getImageWidth(qrData.modules.size, opts);
      const ctx = canvasEl.getContext("2d");
      const image = ctx.createImageData(size, size);
      Utils.qrToImageData(image.data, qrData, opts);
      clearCanvas(ctx, canvasEl, size);
      ctx.putImageData(image, 0, 0);
      return canvasEl;
    }, "render");
    exports.renderToDataURL = /* @__PURE__ */ __name(function renderToDataURL(qrData, canvas, options) {
      let opts = options;
      if (typeof opts === "undefined" && (!canvas || !canvas.getContext)) {
        opts = canvas;
        canvas = void 0;
      }
      if (!opts) opts = {};
      const canvasEl = exports.render(qrData, canvas, opts);
      const type = opts.type || "image/png";
      const rendererOpts = opts.rendererOpts || {};
      return canvasEl.toDataURL(type, rendererOpts.quality);
    }, "renderToDataURL");
  }
});

// node_modules/qrcode/lib/renderer/svg-tag.js
var require_svg_tag = __commonJS({
  "node_modules/qrcode/lib/renderer/svg-tag.js"(exports) {
    init_modules_watch_stub();
    var Utils = require_utils2();
    function getColorAttrib(color, attrib) {
      const alpha = color.a / 255;
      const str = attrib + '="' + color.hex + '"';
      return alpha < 1 ? str + " " + attrib + '-opacity="' + alpha.toFixed(2).slice(1) + '"' : str;
    }
    __name(getColorAttrib, "getColorAttrib");
    function svgCmd(cmd, x, y) {
      let str = cmd + x;
      if (typeof y !== "undefined") str += " " + y;
      return str;
    }
    __name(svgCmd, "svgCmd");
    function qrToPath(data, size, margin) {
      let path = "";
      let moveBy = 0;
      let newRow = false;
      let lineLength = 0;
      for (let i = 0; i < data.length; i++) {
        const col = Math.floor(i % size);
        const row = Math.floor(i / size);
        if (!col && !newRow) newRow = true;
        if (data[i]) {
          lineLength++;
          if (!(i > 0 && col > 0 && data[i - 1])) {
            path += newRow ? svgCmd("M", col + margin, 0.5 + row + margin) : svgCmd("m", moveBy, 0);
            moveBy = 0;
            newRow = false;
          }
          if (!(col + 1 < size && data[i + 1])) {
            path += svgCmd("h", lineLength);
            lineLength = 0;
          }
        } else {
          moveBy++;
        }
      }
      return path;
    }
    __name(qrToPath, "qrToPath");
    exports.render = /* @__PURE__ */ __name(function render(qrData, options, cb) {
      const opts = Utils.getOptions(options);
      const size = qrData.modules.size;
      const data = qrData.modules.data;
      const qrcodesize = size + opts.margin * 2;
      const bg = !opts.color.light.a ? "" : "<path " + getColorAttrib(opts.color.light, "fill") + ' d="M0 0h' + qrcodesize + "v" + qrcodesize + 'H0z"/>';
      const path = "<path " + getColorAttrib(opts.color.dark, "stroke") + ' d="' + qrToPath(data, size, opts.margin) + '"/>';
      const viewBox = 'viewBox="0 0 ' + qrcodesize + " " + qrcodesize + '"';
      const width = !opts.width ? "" : 'width="' + opts.width + '" height="' + opts.width + '" ';
      const svgTag = '<svg xmlns="http://www.w3.org/2000/svg" ' + width + viewBox + ' shape-rendering="crispEdges">' + bg + path + "</svg>\n";
      if (typeof cb === "function") {
        cb(null, svgTag);
      }
      return svgTag;
    }, "render");
  }
});

// node_modules/qrcode/lib/browser.js
var require_browser = __commonJS({
  "node_modules/qrcode/lib/browser.js"(exports) {
    init_modules_watch_stub();
    var canPromise = require_can_promise();
    var QRCode2 = require_qrcode();
    var CanvasRenderer = require_canvas();
    var SvgRenderer = require_svg_tag();
    function renderCanvas(renderFunc, canvas, text, opts, cb) {
      const args = [].slice.call(arguments, 1);
      const argsNum = args.length;
      const isLastArgCb = typeof args[argsNum - 1] === "function";
      if (!isLastArgCb && !canPromise()) {
        throw new Error("Callback required as last argument");
      }
      if (isLastArgCb) {
        if (argsNum < 2) {
          throw new Error("Too few arguments provided");
        }
        if (argsNum === 2) {
          cb = text;
          text = canvas;
          canvas = opts = void 0;
        } else if (argsNum === 3) {
          if (canvas.getContext && typeof cb === "undefined") {
            cb = opts;
            opts = void 0;
          } else {
            cb = opts;
            opts = text;
            text = canvas;
            canvas = void 0;
          }
        }
      } else {
        if (argsNum < 1) {
          throw new Error("Too few arguments provided");
        }
        if (argsNum === 1) {
          text = canvas;
          canvas = opts = void 0;
        } else if (argsNum === 2 && !canvas.getContext) {
          opts = text;
          text = canvas;
          canvas = void 0;
        }
        return new Promise(function(resolve, reject) {
          try {
            const data = QRCode2.create(text, opts);
            resolve(renderFunc(data, canvas, opts));
          } catch (e) {
            reject(e);
          }
        });
      }
      try {
        const data = QRCode2.create(text, opts);
        cb(null, renderFunc(data, canvas, opts));
      } catch (e) {
        cb(e);
      }
    }
    __name(renderCanvas, "renderCanvas");
    exports.create = QRCode2.create;
    exports.toCanvas = renderCanvas.bind(null, CanvasRenderer.render);
    exports.toDataURL = renderCanvas.bind(null, CanvasRenderer.renderToDataURL);
    exports.toString = renderCanvas.bind(null, function(data, _, opts) {
      return SvgRenderer.render(data, opts);
    });
  }
});

// .wrangler/tmp/bundle-kGFB7o/middleware-loader.entry.ts
init_modules_watch_stub();

// .wrangler/tmp/bundle-kGFB7o/middleware-insertion-facade.js
init_modules_watch_stub();

// worker/index.ts
init_modules_watch_stub();

// worker/adminAuth.ts
init_modules_watch_stub();
var SESSION_EXPIRY_HOURS = 8;
var MAX_FAILED_ATTEMPTS = 10;
var LOGIN_WINDOW_MINUTES = 30;
var ADMIN_SESSION_COOKIE = "gyan_admin_session";
var ADMIN_IDENTITY = "global-admin";
var textEncoder = new TextEncoder();
function createJsonResponse(data, status = 200, additionalHeaders) {
  const headers = new Headers(
    additionalHeaders
  );
  headers.set(
    "content-type",
    "application/json; charset=utf-8"
  );
  headers.set(
    "cache-control",
    "no-store"
  );
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers
    }
  );
}
__name(createJsonResponse, "createJsonResponse");
function getConfiguration(env) {
  const password = env.GYAN_ADMIN_PASSWORD?.trim();
  const pepper = env.ADMIN_AUTH_PEPPER?.trim();
  if (!password) {
    return {
      error: "GYAN_ADMIN_PASSWORD is not configured."
    };
  }
  if (!pepper) {
    return {
      error: "ADMIN_AUTH_PEPPER is not configured."
    };
  }
  return {
    password,
    pepper
  };
}
__name(getConfiguration, "getConfiguration");
function isConfigurationError(configuration) {
  return "error" in configuration;
}
__name(isConfigurationError, "isConfigurationError");
function isLocalRequest(request) {
  const hostname = new URL(request.url).hostname;
  return hostname === "localhost" || hostname === "127.0.0.1" || hostname === "::1";
}
__name(isLocalRequest, "isLocalRequest");
function bytesToHex(bytes) {
  return Array.from(bytes).map(
    (byte) => byte.toString(16).padStart(2, "0")
  ).join("");
}
__name(bytesToHex, "bytesToHex");
function bytesToBase64Url(bytes) {
  let binary = "";
  for (const byte of bytes) {
    binary += String.fromCharCode(byte);
  }
  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
}
__name(bytesToBase64Url, "bytesToBase64Url");
async function sha256(value) {
  const digest = await crypto.subtle.digest(
    "SHA-256",
    textEncoder.encode(value)
  );
  return new Uint8Array(digest);
}
__name(sha256, "sha256");
async function hashSecret(value, pepper) {
  return bytesToHex(
    await sha256(
      `${value}:${pepper}`
    )
  );
}
__name(hashSecret, "hashSecret");
async function securelyCompareSecrets(suppliedValue, savedValue) {
  const suppliedDigest = await sha256(suppliedValue);
  const savedDigest = await sha256(savedValue);
  return crypto.subtle.timingSafeEqual(
    suppliedDigest,
    savedDigest
  );
}
__name(securelyCompareSecrets, "securelyCompareSecrets");
function generateSessionToken() {
  const bytes = new Uint8Array(32);
  crypto.getRandomValues(bytes);
  return bytesToBase64Url(bytes);
}
__name(generateSessionToken, "generateSessionToken");
function getClientIp(request) {
  return request.headers.get(
    "CF-Connecting-IP"
  ) ?? request.headers.get(
    "X-Forwarded-For"
  ) ?? "unknown";
}
__name(getClientIp, "getClientIp");
function readCookie(request, cookieName) {
  const cookieHeader = request.headers.get("cookie");
  if (!cookieHeader) {
    return null;
  }
  for (const cookie of cookieHeader.split(";")) {
    const separatorIndex = cookie.indexOf("=");
    if (separatorIndex === -1) {
      continue;
    }
    const name = cookie.slice(0, separatorIndex).trim();
    if (name !== cookieName) {
      continue;
    }
    const encodedValue = cookie.slice(separatorIndex + 1).trim();
    try {
      return decodeURIComponent(
        encodedValue
      );
    } catch {
      return encodedValue;
    }
  }
  return null;
}
__name(readCookie, "readCookie");
function createSessionCookie(request, sessionToken) {
  const isSecure = new URL(request.url).protocol === "https:";
  return [
    `${ADMIN_SESSION_COOKIE}=${encodeURIComponent(
      sessionToken
    )}`,
    "HttpOnly",
    "SameSite=Strict",
    "Path=/",
    `Max-Age=${SESSION_EXPIRY_HOURS * 60 * 60}`,
    isSecure ? "Secure" : ""
  ].filter(Boolean).join("; ");
}
__name(createSessionCookie, "createSessionCookie");
function createExpiredSessionCookie(request) {
  const isSecure = new URL(request.url).protocol === "https:";
  return [
    `${ADMIN_SESSION_COOKIE}=`,
    "HttpOnly",
    "SameSite=Strict",
    "Path=/",
    "Max-Age=0",
    isSecure ? "Secure" : ""
  ].filter(Boolean).join("; ");
}
__name(createExpiredSessionCookie, "createExpiredSessionCookie");
async function cleanExpiredSessions(env) {
  await env.gyan_registry.prepare(
    `
        DELETE FROM admin_sessions
        WHERE
          expires_at <= CURRENT_TIMESTAMP
          OR revoked_at IS NOT NULL
      `
  ).run();
}
__name(cleanExpiredSessions, "cleanExpiredSessions");
async function getRecentFailedAttempts(env, requestIp) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            COUNT(*) AS attempt_count
          FROM admin_login_codes
          WHERE
            email = ?
            AND request_ip = ?
            AND used_at IS NULL
            AND created_at >= datetime(
              'now',
              ?
            )
        `
  ).bind(
    ADMIN_IDENTITY,
    requestIp,
    `-${LOGIN_WINDOW_MINUTES} minutes`
  ).first();
  return Number(
    result?.attempt_count ?? 0
  );
}
__name(getRecentFailedAttempts, "getRecentFailedAttempts");
async function recordFailedAttempt(env, requestIp) {
  await env.gyan_registry.prepare(
    `
        INSERT INTO admin_login_codes (
          email,
          code_hash,
          request_ip,
          expires_at,
          attempt_count
        )
        VALUES (
          ?,
          ?,
          ?,
          datetime(
            'now',
            ?
          ),
          1
        )
      `
  ).bind(
    ADMIN_IDENTITY,
    "password-login-failure",
    requestIp,
    `+${LOGIN_WINDOW_MINUTES} minutes`
  ).run();
}
__name(recordFailedAttempt, "recordFailedAttempt");
async function clearFailedAttempts(env, requestIp) {
  await env.gyan_registry.prepare(
    `
        UPDATE admin_login_codes
        SET used_at =
          CURRENT_TIMESTAMP
        WHERE
          email = ?
          AND request_ip = ?
          AND used_at IS NULL
      `
  ).bind(
    ADMIN_IDENTITY,
    requestIp
  ).run();
}
__name(clearFailedAttempts, "clearFailedAttempts");
async function handleLogin(request, env) {
  const configuration = getConfiguration(env);
  if (isConfigurationError(
    configuration
  )) {
    console.error(
      configuration.error
    );
    return createJsonResponse(
      {
        error: isLocalRequest(request) ? configuration.error : "Administrator login is not configured."
      },
      503
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (typeof body.password !== "string" || body.password.length < 8 || body.password.length > 256) {
    return createJsonResponse(
      {
        error: "Enter the administrator password."
      },
      400
    );
  }
  const requestIp = getClientIp(request);
  const failedAttempts = await getRecentFailedAttempts(
    env,
    requestIp
  );
  if (failedAttempts >= MAX_FAILED_ATTEMPTS) {
    return createJsonResponse(
      {
        error: "Too many failed attempts. Please try again later."
      },
      429
    );
  }
  const passwordMatches = await securelyCompareSecrets(
    body.password,
    configuration.password
  );
  if (!passwordMatches) {
    await recordFailedAttempt(
      env,
      requestIp
    );
    return createJsonResponse(
      {
        error: "The administrator password is incorrect."
      },
      401
    );
  }
  await clearFailedAttempts(
    env,
    requestIp
  );
  try {
    await cleanExpiredSessions(env);
  } catch (error) {
    console.error(
      "Unable to clean expired sessions:",
      error
    );
  }
  const sessionToken = generateSessionToken();
  const sessionHash = await hashSecret(
    sessionToken,
    configuration.pepper
  );
  await env.gyan_registry.prepare(
    `
        INSERT INTO admin_sessions (
          email,
          session_hash,
          expires_at
        )
        VALUES (
          ?,
          ?,
          datetime(
            'now',
            ?
          )
        )
      `
  ).bind(
    ADMIN_IDENTITY,
    sessionHash,
    `+${SESSION_EXPIRY_HOURS} hours`
  ).run();
  return createJsonResponse(
    {
      authenticated: true
    },
    200,
    {
      "set-cookie": createSessionCookie(
        request,
        sessionToken
      )
    }
  );
}
__name(handleLogin, "handleLogin");
async function getAdminSession(request, env) {
  const authEnvironment = env;
  const configuration = getConfiguration(
    authEnvironment
  );
  if (isConfigurationError(
    configuration
  )) {
    return null;
  }
  const sessionToken = readCookie(
    request,
    ADMIN_SESSION_COOKIE
  );
  if (!sessionToken) {
    return null;
  }
  const sessionHash = await hashSecret(
    sessionToken,
    configuration.pepper
  );
  return env.gyan_registry.prepare(
    `
        SELECT
          email,
          expires_at
        FROM admin_sessions
        WHERE
          session_hash = ?
          AND revoked_at IS NULL
          AND expires_at >
            CURRENT_TIMESTAMP
        LIMIT 1
      `
  ).bind(sessionHash).first();
}
__name(getAdminSession, "getAdminSession");
async function handleGetSession(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  return createJsonResponse({
    authenticated: Boolean(session),
    expiresAt: session?.expires_at
  });
}
__name(handleGetSession, "handleGetSession");
async function handleLogout(request, env) {
  const configuration = getConfiguration(env);
  const sessionToken = readCookie(
    request,
    ADMIN_SESSION_COOKIE
  );
  if (sessionToken && !isConfigurationError(
    configuration
  )) {
    const sessionHash = await hashSecret(
      sessionToken,
      configuration.pepper
    );
    await env.gyan_registry.prepare(
      `
          UPDATE admin_sessions
          SET revoked_at =
            CURRENT_TIMESTAMP
          WHERE session_hash = ?
        `
    ).bind(sessionHash).run();
  }
  return createJsonResponse(
    {
      authenticated: false
    },
    200,
    {
      "set-cookie": createExpiredSessionCookie(
        request
      )
    }
  );
}
__name(handleLogout, "handleLogout");
async function handleAdminAuthRoute(request, env, url) {
  const authEnvironment = env;
  if (request.method === "POST" && url.pathname === "/api/admin/login") {
    return handleLogin(
      request,
      authEnvironment
    );
  }
  if (request.method === "GET" && url.pathname === "/api/admin/session") {
    return handleGetSession(
      request,
      env
    );
  }
  if (request.method === "POST" && url.pathname === "/api/admin/logout") {
    return handleLogout(
      request,
      authEnvironment
    );
  }
  return null;
}
__name(handleAdminAuthRoute, "handleAdminAuthRoute");

// worker/adminServices.ts
init_modules_watch_stub();
function createJsonResponse2(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse2, "createJsonResponse");
function normalizeServiceCode(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  if (!/^[A-Z0-9_]{2,50}$/.test(normalized)) {
    return null;
  }
  return normalized;
}
__name(normalizeServiceCode, "normalizeServiceCode");
function normalizeEnabled(value) {
  if (typeof value !== "boolean") {
    return null;
  }
  return value;
}
__name(normalizeEnabled, "normalizeEnabled");
function normalizeSortOrder(value) {
  if (typeof value !== "number" || !Number.isInteger(value) || value < 0 || value > 9999) {
    return null;
  }
  return value;
}
__name(normalizeSortOrder, "normalizeSortOrder");
function mapGlobalService(row) {
  return {
    id: row.id,
    code: row.service_code,
    type: row.service_type,
    category: row.category,
    subCategory: row.sub_category,
    name: row.name,
    description: row.description ?? "",
    icon: row.icon ?? "\u{1F9E9}",
    color: row.color ?? "#607d8b",
    workflowType: row.workflow_type,
    enabled: row.enabled === 1,
    sortOrder: row.sort_order,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
}
__name(mapGlobalService, "mapGlobalService");
async function loadGlobalServices(env) {
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          id,
          service_code,
          service_type,
          category,
          sub_category,
          name,
          description,
          icon,
          color,
          workflow_type,
          enabled,
          sort_order,
          created_at,
          updated_at
        FROM services
        WHERE service_type = 'system'
        ORDER BY
          category ASC,
          sort_order ASC,
          name ASC
      `
  ).all();
  return result.results.map(
    mapGlobalService
  );
}
__name(loadGlobalServices, "loadGlobalServices");
async function requireAdmin(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (!session) {
    return createJsonResponse2(
      {
        error: "Administrator authentication is required."
      },
      401
    );
  }
  return null;
}
__name(requireAdmin, "requireAdmin");
async function handleGetGlobalServices(request, env) {
  const unauthorizedResponse = await requireAdmin(request, env);
  if (unauthorizedResponse) {
    return unauthorizedResponse;
  }
  const services = await loadGlobalServices(env);
  return createJsonResponse2({
    services
  });
}
__name(handleGetGlobalServices, "handleGetGlobalServices");
async function handleUpdateGlobalServices(request, env) {
  const unauthorizedResponse = await requireAdmin(request, env);
  if (unauthorizedResponse) {
    return unauthorizedResponse;
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse2(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (!Array.isArray(body.services)) {
    return createJsonResponse2(
      {
        error: "A services array is required."
      },
      400
    );
  }
  if (body.services.length === 0) {
    return createJsonResponse2(
      {
        error: "At least one service change is required."
      },
      400
    );
  }
  if (body.services.length > 200) {
    return createJsonResponse2(
      {
        error: "Too many service changes were submitted."
      },
      400
    );
  }
  const normalizedChanges = [];
  const submittedCodes = /* @__PURE__ */ new Set();
  for (const item of body.services) {
    if (typeof item !== "object" || item === null) {
      return createJsonResponse2(
        {
          error: "Each service change must be an object."
        },
        400
      );
    }
    const typedItem = item;
    const code = normalizeServiceCode(
      typedItem.code
    );
    const enabled = normalizeEnabled(
      typedItem.enabled
    );
    const sortOrder = normalizeSortOrder(
      typedItem.sortOrder
    );
    if (!code || enabled === null || sortOrder === null) {
      return createJsonResponse2(
        {
          error: "Each service requires a valid code, enabled value and order from 0 to 9999."
        },
        400
      );
    }
    if (submittedCodes.has(code)) {
      return createJsonResponse2(
        {
          error: `Service ${code} was submitted more than once.`
        },
        400
      );
    }
    submittedCodes.add(code);
    normalizedChanges.push({
      code,
      enabled,
      sortOrder
    });
  }
  const placeholders = normalizedChanges.map(() => "?").join(", ");
  const existingResult = await env.gyan_registry.prepare(
    `
          SELECT service_code
          FROM services
          WHERE
            service_type = 'system'
            AND service_code IN (
              ${placeholders}
            )
        `
  ).bind(
    ...normalizedChanges.map(
      (change) => change.code
    )
  ).all();
  const existingCodes = new Set(
    existingResult.results.map(
      (row) => row.service_code
    )
  );
  const missingCodes = normalizedChanges.map((change) => change.code).filter(
    (code) => !existingCodes.has(code)
  );
  if (missingCodes.length > 0) {
    return createJsonResponse2(
      {
        error: `Unknown global service: ${missingCodes.join(
          ", "
        )}`
      },
      400
    );
  }
  const statements = normalizedChanges.map(
    (change) => env.gyan_registry.prepare(
      `
              UPDATE services
              SET
                enabled = ?,
                sort_order = ?,
                updated_at =
                  CURRENT_TIMESTAMP
              WHERE
                service_code = ?
                AND service_type = 'system'
            `
    ).bind(
      change.enabled ? 1 : 0,
      change.sortOrder,
      change.code
    )
  );
  await env.gyan_registry.batch(
    statements
  );
  const services = await loadGlobalServices(env);
  return createJsonResponse2({
    message: "Changes saved.",
    services
  });
}
__name(handleUpdateGlobalServices, "handleUpdateGlobalServices");
async function handleAdminServicesRoute(request, env, url) {
  if (url.pathname !== "/api/admin/services") {
    return null;
  }
  if (request.method === "GET") {
    return handleGetGlobalServices(
      request,
      env
    );
  }
  if (request.method === "PUT") {
    return handleUpdateGlobalServices(
      request,
      env
    );
  }
  return createJsonResponse2(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminServicesRoute, "handleAdminServicesRoute");

// worker/adminShops.ts
init_modules_watch_stub();
function createJsonResponse3(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse3, "createJsonResponse");
function normalizeShopCode(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode, "normalizeShopCode");
function normalizeRequiredText(value, maximumLength) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  if (normalized.length === 0 || normalized.length > maximumLength) {
    return null;
  }
  return normalized;
}
__name(normalizeRequiredText, "normalizeRequiredText");
function normalizeOptionalText(value, maximumLength) {
  if (value === null || value === void 0 || value === "") {
    return null;
  }
  if (typeof value !== "string") {
    return "invalid";
  }
  const normalized = value.trim();
  if (!normalized) {
    return null;
  }
  if (normalized.length > maximumLength) {
    return "invalid";
  }
  return normalized;
}
__name(normalizeOptionalText, "normalizeOptionalText");
function normalizeEmail(value) {
  const normalized = normalizeOptionalText(
    value,
    254
  );
  if (normalized === null || normalized === "invalid") {
    return normalized;
  }
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    normalized
  ) ? normalized : "invalid";
}
__name(normalizeEmail, "normalizeEmail");
function normalizeStatus(value) {
  if (value === "active" || value === "inactive") {
    return value;
  }
  return null;
}
__name(normalizeStatus, "normalizeStatus");
function normalizeServiceCode2(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode2, "normalizeServiceCode");
function normalizeMode(value) {
  if (value === "inherit" || value === "enabled" || value === "disabled") {
    return value;
  }
  return null;
}
__name(normalizeMode, "normalizeMode");
function normalizeSortOrder2(value) {
  if (value === null || value === void 0 || value === "") {
    return null;
  }
  if (typeof value !== "number" || !Number.isInteger(value) || value < 0 || value > 9999) {
    return "invalid";
  }
  return value;
}
__name(normalizeSortOrder2, "normalizeSortOrder");
function mapShop(shop) {
  return {
    code: shop.code,
    name: shop.name,
    ownerName: shop.owner_name,
    phoneNumber: shop.phone_number,
    whatsAppNumber: shop.whatsapp_number ?? "",
    emailAddress: shop.email_address ?? "",
    addressLine: shop.address_line,
    city: shop.city,
    state: shop.state,
    postalCode: shop.postal_code,
    status: shop.status,
    createdAt: shop.created_at,
    updatedAt: shop.updated_at
  };
}
__name(mapShop, "mapShop");
async function requireAdmin2(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (session) {
    return null;
  }
  return createJsonResponse3(
    {
      error: "Administrator authentication is required."
    },
    401
  );
}
__name(requireAdmin2, "requireAdmin");
async function loadShop(env, shopCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          owner_name,
          phone_number,
          whatsapp_number,
          email_address,
          address_line,
          city,
          state,
          postal_code,
          status,
          created_at,
          updated_at

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(shopCode).first();
}
__name(loadShop, "loadShop");
async function loadShopServices(env, shopCode) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            s.id,
            s.service_code,
            s.category,
            s.sub_category,
            s.name,
            s.description,
            s.icon,
            s.color,

            CAST(
              s.enabled AS INTEGER
            ) AS global_enabled,

            s.sort_order
              AS global_sort_order,

            ss.enabled
              AS override_enabled,

            ss.sort_order
              AS override_sort_order

          FROM services s

          LEFT JOIN shop_services ss
            ON ss.service_id = s.id
            AND ss.shop_code = ?

          WHERE
            s.service_type = 'system'

          ORDER BY
            s.category ASC,

            COALESCE(
              ss.sort_order,
              s.sort_order
            ) ASC,

            s.name ASC
        `
  ).bind(shopCode).all();
  return result.results.map(
    (row) => {
      const hasOverride = row.override_enabled !== null;
      const overrideEnabled = hasOverride ? Boolean(
        row.override_enabled
      ) : null;
      const mode = overrideEnabled === null ? "inherit" : overrideEnabled ? "enabled" : "disabled";
      return {
        id: row.id,
        code: row.service_code,
        category: row.category,
        subCategory: row.sub_category,
        name: row.name,
        description: row.description ?? "",
        icon: row.icon ?? "\u{1F9E9}",
        color: row.color ?? "#607d8b",
        globalEnabled: Boolean(
          row.global_enabled
        ),
        globalSortOrder: row.global_sort_order,
        mode,
        overrideEnabled,
        overrideSortOrder: row.override_sort_order,
        effectiveEnabled: overrideEnabled ?? Boolean(
          row.global_enabled
        ),
        effectiveSortOrder: row.override_sort_order ?? row.global_sort_order
      };
    }
  );
}
__name(loadShopServices, "loadShopServices");
async function handleGetShops(request, env) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            code,
            name,
            owner_name,
            phone_number,
            whatsapp_number,
            email_address,
            address_line,
            city,
            state,
            postal_code,
            status,
            created_at,
            updated_at

          FROM shops

          ORDER BY
            name ASC,
            code ASC
        `
  ).all();
  return createJsonResponse3({
    shops: result.results.map(
      mapShop
    )
  });
}
__name(handleGetShops, "handleGetShops");
async function handleGetShopInformation(request, env, shopCode) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const shop = await loadShop(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse3(
      {
        error: "Shop not found."
      },
      404
    );
  }
  return createJsonResponse3({
    shop: mapShop(shop)
  });
}
__name(handleGetShopInformation, "handleGetShopInformation");
async function handleUpdateShopInformation(request, env, shopCode) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const existingShop = await loadShop(
    env,
    shopCode
  );
  if (!existingShop) {
    return createJsonResponse3(
      {
        error: "Shop not found."
      },
      404
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse3(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const name = normalizeRequiredText(
    body.name,
    150
  );
  const ownerName = normalizeRequiredText(
    body.ownerName,
    150
  );
  const phoneNumber = normalizeRequiredText(
    body.phoneNumber,
    40
  );
  const whatsAppNumber = normalizeOptionalText(
    body.whatsAppNumber,
    40
  );
  const emailAddress = normalizeEmail(
    body.emailAddress
  );
  const addressLine = normalizeRequiredText(
    body.addressLine,
    250
  );
  const city = normalizeRequiredText(
    body.city,
    100
  );
  const state = normalizeRequiredText(
    body.state,
    100
  );
  const postalCode = normalizeRequiredText(
    body.postalCode,
    30
  );
  const status = normalizeStatus(
    body.status
  );
  if (!name || !ownerName || !phoneNumber || whatsAppNumber === "invalid" || emailAddress === "invalid" || !addressLine || !city || !state || !postalCode || !status) {
    return createJsonResponse3(
      {
        error: "Please provide valid shop, owner, contact, address and status information."
      },
      400
    );
  }
  await env.gyan_registry.prepare(
    `
        UPDATE shops

        SET
          name = ?,
          owner_name = ?,
          phone_number = ?,
          whatsapp_number = ?,
          email_address = ?,
          address_line = ?,
          city = ?,
          state = ?,
          postal_code = ?,
          status = ?,
          updated_at =
            CURRENT_TIMESTAMP

        WHERE code = ?
      `
  ).bind(
    name,
    ownerName,
    phoneNumber,
    whatsAppNumber,
    emailAddress,
    addressLine,
    city,
    state,
    postalCode,
    status,
    shopCode
  ).run();
  const updatedShop = await loadShop(
    env,
    shopCode
  );
  if (!updatedShop) {
    return createJsonResponse3(
      {
        error: "The shop was updated but could not be reloaded."
      },
      500
    );
  }
  return createJsonResponse3({
    message: "Shop information saved.",
    shop: mapShop(updatedShop)
  });
}
__name(handleUpdateShopInformation, "handleUpdateShopInformation");
async function handleGetShopServices(request, env, shopCode) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const shop = await loadShop(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse3(
      {
        error: "Shop not found."
      },
      404
    );
  }
  const services = await loadShopServices(
    env,
    shopCode
  );
  return createJsonResponse3({
    shop: mapShop(shop),
    services
  });
}
__name(handleGetShopServices, "handleGetShopServices");
async function handleUpdateShopServices(request, env, shopCode) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const shop = await loadShop(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse3(
      {
        error: "Shop not found."
      },
      404
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse3(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (!Array.isArray(
    body.services
  ) || body.services.length === 0) {
    return createJsonResponse3(
      {
        error: "At least one service change is required."
      },
      400
    );
  }
  const normalizedChanges = [];
  const codes = /* @__PURE__ */ new Set();
  for (const rawChange of body.services) {
    if (typeof rawChange !== "object" || rawChange === null) {
      return createJsonResponse3(
        {
          error: "Each service change must be an object."
        },
        400
      );
    }
    const change = rawChange;
    const code = normalizeServiceCode2(
      change.code
    );
    const mode = normalizeMode(
      change.mode
    );
    const sortOrder = normalizeSortOrder2(
      change.sortOrder
    );
    if (!code || !mode || sortOrder === "invalid") {
      return createJsonResponse3(
        {
          error: "Each service requires a valid code, mode and optional order from 0 to 9999."
        },
        400
      );
    }
    if (codes.has(code)) {
      return createJsonResponse3(
        {
          error: `${code} was submitted more than once.`
        },
        400
      );
    }
    codes.add(code);
    normalizedChanges.push({
      code,
      mode,
      sortOrder: mode === "inherit" ? null : sortOrder
    });
  }
  const serviceRows = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            service_code,
            sort_order

          FROM services

          WHERE
            service_type =
              'system'
        `
  ).all();
  const serviceMap = new Map(
    serviceRows.results.map(
      (service) => [
        service.service_code,
        service
      ]
    )
  );
  const statements = [];
  for (const change of normalizedChanges) {
    const service = serviceMap.get(
      change.code
    );
    if (!service) {
      return createJsonResponse3(
        {
          error: `Unknown service: ${change.code}`
        },
        400
      );
    }
    if (change.mode === "inherit") {
      statements.push(
        env.gyan_registry.prepare(
          `
              DELETE FROM
                shop_services

              WHERE
                shop_code = ?
                AND service_id = ?
            `
        ).bind(
          shopCode,
          service.id
        )
      );
      continue;
    }
    const enabled = change.mode === "enabled" ? 1 : 0;
    const sortOrder = change.sortOrder ?? service.sort_order;
    statements.push(
      env.gyan_registry.prepare(
        `
            INSERT INTO shop_services (
              shop_code,
              service_id,
              enabled,
              sort_order,
              updated_at
            )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              CURRENT_TIMESTAMP
            )

            ON CONFLICT(
              shop_code,
              service_id
            )
            DO UPDATE SET
              enabled =
                excluded.enabled,

              sort_order =
                excluded.sort_order,

              updated_at =
                CURRENT_TIMESTAMP
          `
      ).bind(
        shopCode,
        service.id,
        enabled,
        sortOrder
      )
    );
  }
  await env.gyan_registry.batch(
    statements
  );
  return createJsonResponse3({
    message: "Changes saved.",
    shop: mapShop(shop),
    services: await loadShopServices(
      env,
      shopCode
    )
  });
}
__name(handleUpdateShopServices, "handleUpdateShopServices");
async function handleAdminShopsRoute(request, env, url) {
  if (request.method === "GET" && url.pathname === "/api/admin/shops") {
    return handleGetShops(
      request,
      env
    );
  }
  const servicesMatch = url.pathname.match(
    /^\/api\/admin\/shops\/([A-Za-z0-9]{4})\/services$/
  );
  if (servicesMatch) {
    const shopCode2 = normalizeShopCode(
      servicesMatch[1]
    );
    if (!shopCode2) {
      return createJsonResponse3(
        {
          error: "Invalid shop code."
        },
        400
      );
    }
    if (request.method === "GET") {
      return handleGetShopServices(
        request,
        env,
        shopCode2
      );
    }
    if (request.method === "PUT") {
      return handleUpdateShopServices(
        request,
        env,
        shopCode2
      );
    }
    return createJsonResponse3(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const informationMatch = url.pathname.match(
    /^\/api\/admin\/shops\/([A-Za-z0-9]{4})$/
  );
  if (!informationMatch) {
    return null;
  }
  const shopCode = normalizeShopCode(
    informationMatch[1]
  );
  if (!shopCode) {
    return createJsonResponse3(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  if (request.method === "GET") {
    return handleGetShopInformation(
      request,
      env,
      shopCode
    );
  }
  if (request.method === "PUT") {
    return handleUpdateShopInformation(
      request,
      env,
      shopCode
    );
  }
  return createJsonResponse3(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminShopsRoute, "handleAdminShopsRoute");

// worker/printRequests.ts
init_modules_watch_stub();

// worker/storageGuard.ts
init_modules_watch_stub();
var DEFAULT_WARNING_BYTES = 8 * 1024 * 1024 * 1024;
var DEFAULT_STOP_BYTES = 9 * 1024 * 1024 * 1024;
var DEFAULT_RETENTION_DAYS = 15;
var CLEANUP_SAFETY_DAYS = 1;
function parseBoolean(value, fallback) {
  if (value === "true") {
    return true;
  }
  if (value === "false") {
    return false;
  }
  return fallback;
}
__name(parseBoolean, "parseBoolean");
function parseNonNegativeNumber(value, fallback) {
  const parsed = Number(value);
  if (!Number.isFinite(parsed) || parsed < 0) {
    return fallback;
  }
  return parsed;
}
__name(parseNonNegativeNumber, "parseNonNegativeNumber");
async function getStorageUsageSettings(env) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            setting_key,
            setting_value

          FROM system_settings

          WHERE setting_key IN (
            'uploads_enabled',
            'storage_warning_bytes',
            'storage_stop_bytes',
            'storage_used_bytes',
            'storage_warning_active',
            'file_retention_days'
          )
        `
  ).all();
  const settings = new Map(
    result.results.map(
      (row) => [
        row.setting_key,
        row.setting_value
      ]
    )
  );
  return {
    uploadsEnabled: parseBoolean(
      settings.get(
        "uploads_enabled"
      ),
      true
    ),
    warningBytes: parseNonNegativeNumber(
      settings.get(
        "storage_warning_bytes"
      ),
      DEFAULT_WARNING_BYTES
    ),
    stopBytes: parseNonNegativeNumber(
      settings.get(
        "storage_stop_bytes"
      ),
      DEFAULT_STOP_BYTES
    ),
    usedBytes: parseNonNegativeNumber(
      settings.get(
        "storage_used_bytes"
      ),
      0
    ),
    warningActive: parseBoolean(
      settings.get(
        "storage_warning_active"
      ),
      false
    ),
    retentionDays: Math.max(
      1,
      Math.floor(
        parseNonNegativeNumber(
          settings.get(
            "file_retention_days"
          ),
          DEFAULT_RETENTION_DAYS
        )
      )
    )
  };
}
__name(getStorageUsageSettings, "getStorageUsageSettings");
async function assertUploadCapacity(env, incomingBytes) {
  const settings = await getStorageUsageSettings(
    env
  );
  const projectedBytes = settings.usedBytes + incomingBytes;
  if (!settings.uploadsEnabled) {
    return {
      allowed: false,
      error: "File uploads are temporarily paused. Please contact the shop.",
      status: 503,
      usedBytes: settings.usedBytes,
      projectedBytes,
      stopBytes: settings.stopBytes
    };
  }
  if (projectedBytes >= settings.stopBytes) {
    return {
      allowed: false,
      error: "File uploads are temporarily unavailable because storage capacity is nearly full. Please contact the shop.",
      status: 507,
      usedBytes: settings.usedBytes,
      projectedBytes,
      stopBytes: settings.stopBytes
    };
  }
  return {
    allowed: true,
    warningActive: projectedBytes >= settings.warningBytes,
    projectedBytes,
    stopBytes: settings.stopBytes
  };
}
__name(assertUploadCapacity, "assertUploadCapacity");
async function addStoredBytes(env, addedBytes) {
  if (addedBytes <= 0) {
    return;
  }
  const settings = await getStorageUsageSettings(
    env
  );
  const updatedBytes = settings.usedBytes + addedBytes;
  const warningActive = updatedBytes >= settings.warningBytes;
  const uploadsEnabled = updatedBytes < settings.stopBytes;
  await env.gyan_registry.batch([
    env.gyan_registry.prepare(
      `
          INSERT INTO system_settings (
            setting_key,
            setting_value,
            updated_at
          )
          VALUES (
            'storage_used_bytes',
            ?,
            CURRENT_TIMESTAMP
          )

          ON CONFLICT(setting_key)
          DO UPDATE SET
            setting_value =
              excluded.setting_value,

            updated_at =
              CURRENT_TIMESTAMP
        `
    ).bind(
      String(updatedBytes)
    ),
    env.gyan_registry.prepare(
      `
          INSERT INTO system_settings (
            setting_key,
            setting_value,
            updated_at
          )
          VALUES (
            'storage_warning_active',
            ?,
            CURRENT_TIMESTAMP
          )

          ON CONFLICT(setting_key)
          DO UPDATE SET
            setting_value =
              excluded.setting_value,

            updated_at =
              CURRENT_TIMESTAMP
        `
    ).bind(
      warningActive ? "true" : "false"
    ),
    env.gyan_registry.prepare(
      `
          INSERT INTO system_settings (
            setting_key,
            setting_value,
            updated_at
          )
          VALUES (
            'uploads_enabled',
            ?,
            CURRENT_TIMESTAMP
          )

          ON CONFLICT(setting_key)
          DO UPDATE SET
            setting_value =
              excluded.setting_value,

            updated_at =
              CURRENT_TIMESTAMP
        `
    ).bind(
      uploadsEnabled ? "true" : "false"
    )
  ]);
}
__name(addStoredBytes, "addStoredBytes");
async function removeStoredBytes(env, removedBytes) {
  if (removedBytes <= 0) {
    return;
  }
  const settings = await getStorageUsageSettings(
    env
  );
  const updatedBytes = Math.max(
    0,
    settings.usedBytes - removedBytes
  );
  const warningActive = updatedBytes >= settings.warningBytes;
  const uploadsEnabled = updatedBytes < settings.stopBytes;
  await env.gyan_registry.batch([
    env.gyan_registry.prepare(
      `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'storage_used_bytes'
        `
    ).bind(
      String(updatedBytes)
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'storage_warning_active'
        `
    ).bind(
      warningActive ? "true" : "false"
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'uploads_enabled'
        `
    ).bind(
      uploadsEnabled ? "true" : "false"
    )
  ]);
}
__name(removeStoredBytes, "removeStoredBytes");
async function reconcileExpiredStorage(env) {
  const settings = await getStorageUsageSettings(
    env
  );
  const reconciliationAgeDays = settings.retentionDays + CLEANUP_SAFETY_DAYS;
  const ageModifier = `-${reconciliationAgeDays} days`;
  const expiredStorage = await env.gyan_registry.prepare(
    `
          SELECT
            COALESCE(
              SUM(file_size),
              0
            ) AS total_bytes,

            COUNT(*) AS file_count

          FROM print_request_files

          WHERE
            storage_status = 'stored'

            AND created_at <=
              datetime(
                'now',
                ?
              )
        `
  ).bind(ageModifier).first();
  const removedBytes = Number(
    expiredStorage?.total_bytes ?? 0
  );
  const expiredFileCount = Number(
    expiredStorage?.file_count ?? 0
  );
  if (expiredFileCount === 0) {
    return {
      expiredFileCount: 0,
      removedBytes: 0
    };
  }
  await env.gyan_registry.prepare(
    `
        UPDATE print_request_files

        SET
          storage_status =
            'expired',

          storage_key = NULL

        WHERE
          storage_status =
            'stored'

          AND created_at <=
            datetime(
              'now',
              ?
            )
      `
  ).bind(ageModifier).run();
  await removeStoredBytes(
    env,
    removedBytes
  );
  return {
    expiredFileCount,
    removedBytes
  };
}
__name(reconcileExpiredStorage, "reconcileExpiredStorage");

// worker/shopNotifications.ts
init_modules_watch_stub();
function escapeHtml(value) {
  return value.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;").replaceAll("'", "&#039;");
}
__name(escapeHtml, "escapeHtml");
function formatSetting(value) {
  return value.replaceAll("-", " ").replace(
    /\b\w/g,
    (character) => character.toUpperCase()
  );
}
__name(formatSetting, "formatSetting");
function normalizeWhatsAppNumber(value) {
  let digits = value.replace(/\D/g, "");
  if (digits.length === 10) {
    digits = `91${digits}`;
  }
  return digits;
}
__name(normalizeWhatsAppNumber, "normalizeWhatsAppNumber");
function createWhatsAppLink(whatsAppNumber, orderNumber, customerName) {
  const normalizedNumber = normalizeWhatsAppNumber(
    whatsAppNumber
  );
  if (!normalizedNumber) {
    return null;
  }
  const message = [
    `Hello ${customerName},`,
    "",
    `We received your GYAN print request ${orderNumber}.`,
    "We will review the documents and confirm the final amount shortly."
  ].join("\n");
  return `https://wa.me/${normalizedNumber}?text=${encodeURIComponent(message)}`;
}
__name(createWhatsAppLink, "createWhatsAppLink");
async function sendPrintRequestEmail(env, notification) {
  if (!notification.shopEmail) {
    return {
      sent: false,
      reason: "The shop does not have an email address."
    };
  }
  if (!env.RESEND_API_KEY) {
    return {
      sent: false,
      reason: "RESEND_API_KEY is not configured."
    };
  }
  const whatsappLink = createWhatsAppLink(
    notification.whatsAppNumber || notification.phoneNumber,
    notification.orderNumber,
    notification.customerName
  );
  const fileList = notification.fileNames.map(
    (fileName) => `<li>${escapeHtml(fileName)}</li>`
  ).join("");
  const instructionsHtml = notification.instructions ? escapeHtml(
    notification.instructions
  ) : "No special instructions";
  const customerEmailHtml = notification.emailAddress ? escapeHtml(
    notification.emailAddress
  ) : "Not provided";
  const whatsappButton = whatsappLink ? `
        <p style="margin:24px 0;">
          <a
            href="${escapeHtml(whatsappLink)}"
            style="
              display:inline-block;
              padding:12px 18px;
              background:#1f8f4e;
              color:#ffffff;
              text-decoration:none;
              font-weight:700;
              border-radius:4px;
            "
          >
            Open customer WhatsApp
          </a>
        </p>
      ` : "";
  const html = `
    <div
      style="
        max-width:640px;
        margin:0 auto;
        padding:24px;
        background:#fffdf8;
        color:#332317;
        font-family:Arial,sans-serif;
        line-height:1.5;
      "
    >
      <p
        style="
          margin:0;
          color:#7d6a54;
          font-size:12px;
          font-weight:700;
          letter-spacing:1px;
        "
      >
        GYAN PRINT
      </p>

      <h1
        style="
          margin:6px 0 4px;
          font-size:24px;
        "
      >
        New print request
      </h1>

      <p style="margin-top:0;">
        A new print request was submitted to
        <strong>
          ${escapeHtml(notification.shopName)}
        </strong>.
      </p>

      <div
        style="
          margin:20px 0;
          padding:16px;
          background:#f4eadc;
          border:1px solid #e3d5c2;
        "
      >
        <div style="font-size:12px;color:#7d6a54;">
          ORDER NUMBER
        </div>

        <div
          style="
            margin-top:4px;
            font-family:Consolas,monospace;
            font-size:20px;
            font-weight:700;
          "
        >
          ${escapeHtml(notification.orderNumber)}
        </div>
      </div>

      <h2 style="font-size:17px;">
        Customer
      </h2>

      <table
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Name
          </td>
          <td style="padding:6px 0;font-weight:700;">
            ${escapeHtml(notification.customerName)}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Mobile
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(notification.phoneNumber)}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            WhatsApp
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    notification.whatsAppNumber || notification.phoneNumber
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Email
          </td>
          <td style="padding:6px 0;">
            ${customerEmailHtml}
          </td>
        </tr>
      </table>

      ${whatsappButton}

      <h2 style="font-size:17px;">
        Print preferences
      </h2>

      <table
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Estimated pages
          </td>
          <td style="padding:6px 0;">
            ${notification.estimatedPages}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Copies
          </td>
          <td style="padding:6px 0;">
            ${notification.copies}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Color
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    formatSetting(
      notification.colorMode
    )
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Sides
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    formatSetting(
      notification.printSides
    )
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Paper
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    notification.paperSize.toUpperCase()
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Estimate
          </td>
          <td style="padding:6px 0;font-weight:700;">
            \u20B9${notification.estimatedAmountRupees}
          </td>
        </tr>
      </table>

      <h2 style="font-size:17px;">
        Uploaded files
      </h2>

      <ul>
        ${fileList}
      </ul>

      <h2 style="font-size:17px;">
        Instructions
      </h2>

      <p
        style="
          padding:12px;
          background:#ffffff;
          border:1px solid #e8dfd1;
        "
      >
        ${instructionsHtml}
      </p>

      <p
        style="
          margin-top:24px;
          color:#7d6a54;
          font-size:12px;
        "
      >
        This notification was generated automatically by GYAN.
      </p>
    </div>
  `;
  try {
    const response = await fetch(
      "https://api.resend.com/emails",
      {
        method: "POST",
        headers: {
          authorization: `Bearer ${env.RESEND_API_KEY}`,
          "content-type": "application/json"
        },
        body: JSON.stringify({
          from: "GYAN Orders <admin@gyan.cc>",
          to: [
            notification.shopEmail
          ],
          subject: `New print request ${notification.orderNumber}`,
          html
        })
      }
    );
    const result = await response.json();
    if (!response.ok) {
      const reason = result.message ?? result.error?.message ?? "Resend rejected the email.";
      console.error(
        "Print notification email failed:",
        reason
      );
      return {
        sent: false,
        reason
      };
    }
    return {
      sent: true,
      emailId: result.id
    };
  } catch (error) {
    const reason = error instanceof Error ? error.message : "Unexpected email error.";
    console.error(
      "Print notification email failed:",
      reason
    );
    return {
      sent: false,
      reason
    };
  }
}
__name(sendPrintRequestEmail, "sendPrintRequestEmail");

// worker/printRequests.ts
var MAX_TOTAL_FILE_SIZE = 25 * 1024 * 1024;
var allowedExtensions = /* @__PURE__ */ new Set([
  "pdf",
  "doc",
  "docx",
  "txt",
  "rtf",
  "jpg",
  "jpeg",
  "png"
]);
function createJsonResponse4(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse4, "createJsonResponse");
function normalizeShopCode2(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode2, "normalizeShopCode");
function getRequiredText(formData, name) {
  const value = formData.get(name);
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized ? normalized : null;
}
__name(getRequiredText, "getRequiredText");
function getOptionalText(formData, name) {
  const value = formData.get(name);
  return typeof value === "string" ? value.trim() : "";
}
__name(getOptionalText, "getOptionalText");
function getInteger(formData, name, minimum, maximum) {
  const value = formData.get(name);
  if (typeof value !== "string") {
    return null;
  }
  const parsed = Number(value);
  if (!Number.isInteger(parsed) || parsed < minimum || parsed > maximum) {
    return null;
  }
  return parsed;
}
__name(getInteger, "getInteger");
function getFileExtension(fileName) {
  return fileName.split(".").pop()?.toLowerCase() ?? "";
}
__name(getFileExtension, "getFileExtension");
function sanitizeFileName(fileName) {
  const sanitized = fileName.trim().replace(
    /[^A-Za-z0-9._-]+/g,
    "_"
  ).replace(
    /^_+|_+$/g,
    ""
  );
  return (sanitized || "uploaded-file").slice(0, 180);
}
__name(sanitizeFileName, "sanitizeFileName");
function generateOrderNumber(shopCode) {
  const now = /* @__PURE__ */ new Date();
  const datePart = [
    now.getUTCFullYear(),
    String(
      now.getUTCMonth() + 1
    ).padStart(2, "0"),
    String(
      now.getUTCDate()
    ).padStart(2, "0")
  ].join("");
  const randomPart = crypto.randomUUID().replace(/-/g, "").slice(0, 6).toUpperCase();
  return `PR-${shopCode}-${datePart}-${randomPart}`;
}
__name(generateOrderNumber, "generateOrderNumber");
function createStorageKey(shopCode, orderNumber, file, index) {
  const safeFileName = sanitizeFileName(
    file.name
  );
  const randomPart = crypto.randomUUID().replace(/-/g, "").slice(0, 10);
  const fileNumber = String(index + 1).padStart(2, "0");
  return [
    "print-requests",
    shopCode,
    orderNumber,
    `${fileNumber}-${randomPart}-${safeFileName}`
  ].join("/");
}
__name(createStorageKey, "createStorageKey");
async function deleteStoredFiles(env, storedFiles) {
  if (storedFiles.length === 0) {
    return;
  }
  try {
    await env.GYAN_PRINT_FILES.delete(
      storedFiles.map(
        (storedFile) => storedFile.storageKey
      )
    );
  } catch (error) {
    console.error(
      "Unable to clean up R2 files:",
      error
    );
  }
}
__name(deleteStoredFiles, "deleteStoredFiles");
async function deletePrintRequest(env, printRequestId) {
  try {
    await env.gyan_registry.prepare(
      `
          DELETE FROM print_requests
          WHERE id = ?
        `
    ).bind(printRequestId).run();
  } catch (error) {
    console.error(
      "Unable to clean up print request:",
      error
    );
  }
}
__name(deletePrintRequest, "deletePrintRequest");
async function handleCreatePrintRequest(request, env, shopCode) {
  const shop = await env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          status,
          email_address,
          whatsapp_number

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(shopCode).first();
  if (!shop) {
    return createJsonResponse4(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse4(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  let formData;
  try {
    formData = await request.formData();
  } catch {
    return createJsonResponse4(
      {
        error: "The submitted form data could not be read."
      },
      400
    );
  }
  const customerName = getRequiredText(
    formData,
    "customerName"
  );
  const phoneNumber = getRequiredText(
    formData,
    "phoneNumber"
  );
  const emailAddress = getOptionalText(
    formData,
    "emailAddress"
  );
  const whatsAppNumber = getOptionalText(
    formData,
    "whatsAppNumber"
  );
  const whatsAppConsent = formData.get(
    "whatsAppConsent"
  ) === "true";
  const estimatedPages = getInteger(
    formData,
    "estimatedPages",
    1,
    1e3
  );
  const copies = getInteger(
    formData,
    "copies",
    1,
    100
  );
  const estimatedAmountRupees = getInteger(
    formData,
    "estimatedAmountRupees",
    0,
    1e6
  );
  const colorMode = getRequiredText(
    formData,
    "colorMode"
  );
  const printSides = getRequiredText(
    formData,
    "printSides"
  );
  const paperSize = getRequiredText(
    formData,
    "paperSize"
  );
  const instructions = getOptionalText(
    formData,
    "instructions"
  );
  if (!customerName || !phoneNumber || estimatedPages === null || copies === null || estimatedAmountRupees === null || !colorMode || !printSides || !paperSize) {
    return createJsonResponse4(
      {
        error: "Required print-request information is missing or invalid."
      },
      400
    );
  }
  if (![
    "black-white",
    "color"
  ].includes(colorMode)) {
    return createJsonResponse4(
      {
        error: "Invalid color setting."
      },
      400
    );
  }
  if (![
    "single",
    "double"
  ].includes(printSides)) {
    return createJsonResponse4(
      {
        error: "Invalid print-side setting."
      },
      400
    );
  }
  if (![
    "a4",
    "letter",
    "legal"
  ].includes(paperSize)) {
    return createJsonResponse4(
      {
        error: "Invalid paper size."
      },
      400
    );
  }
  const files = formData.getAll("files").filter(
    (value) => value instanceof File
  );
  if (files.length === 0) {
    return createJsonResponse4(
      {
        error: "At least one print file is required."
      },
      400
    );
  }
  const invalidFile = files.find(
    (file) => !allowedExtensions.has(
      getFileExtension(
        file.name
      )
    )
  );
  if (invalidFile) {
    return createJsonResponse4(
      {
        error: `Unsupported file type: ${invalidFile.name}`
      },
      400
    );
  }
  const totalFileSize = files.reduce(
    (total, file) => total + file.size,
    0
  );
  if (totalFileSize > MAX_TOTAL_FILE_SIZE) {
    return createJsonResponse4(
      {
        error: "The total file size cannot exceed 25 MB."
      },
      400
    );
  }
  const storageCapacity = await assertUploadCapacity(
    env,
    totalFileSize
  );
  if (!storageCapacity.allowed) {
    return createJsonResponse4(
      {
        error: storageCapacity.error,
        storage: {
          state: "stopped",
          usedBytes: storageCapacity.usedBytes,
          projectedBytes: storageCapacity.projectedBytes,
          stopBytes: storageCapacity.stopBytes
        }
      },
      storageCapacity.status
    );
  }
  const orderNumber = generateOrderNumber(
    shopCode
  );
  let createdRequest = null;
  const storedFiles = [];
  try {
    createdRequest = await env.gyan_registry.prepare(
      `
            INSERT INTO print_requests (
              order_number,
              shop_code,
              customer_name,
              phone_number,
              email_address,
              whatsapp_number,
              whatsapp_consent,
              estimated_pages,
              copies,
              color_mode,
              print_sides,
              paper_size,
              instructions,
              estimated_amount_rupees,
              status
            )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              'submitted'
            )

            RETURNING
              id,
              order_number,
              status,
              created_at
          `
    ).bind(
      orderNumber,
      shopCode,
      customerName,
      phoneNumber,
      emailAddress || null,
      whatsAppNumber || null,
      whatsAppConsent ? 1 : 0,
      estimatedPages,
      copies,
      colorMode,
      printSides,
      paperSize,
      instructions || null,
      estimatedAmountRupees
    ).first();
    if (!createdRequest) {
      throw new Error(
        "The print request could not be created."
      );
    }
    for (let index = 0; index < files.length; index += 1) {
      const file = files[index];
      const contentType = file.type || "application/octet-stream";
      const storageKey = createStorageKey(
        shopCode,
        orderNumber,
        file,
        index
      );
      const storedObject = await env.GYAN_PRINT_FILES.put(
        storageKey,
        file.stream(),
        {
          httpMetadata: {
            contentType
          },
          customMetadata: {
            orderNumber,
            shopCode,
            originalFileName: file.name
          }
        }
      );
      if (!storedObject) {
        throw new Error(
          `The file ${file.name} could not be stored.`
        );
      }
      storedFiles.push({
        file,
        storageKey,
        contentType
      });
    }
    const fileStatements = storedFiles.map(
      (storedFile) => env.gyan_registry.prepare(
        `
                INSERT INTO print_request_files (
                  print_request_id,
                  original_file_name,
                  content_type,
                  file_size,
                  storage_key,
                  storage_status
                )
                VALUES (
                  ?,
                  ?,
                  ?,
                  ?,
                  ?,
                  'stored'
                )
              `
      ).bind(
        createdRequest.id,
        storedFile.file.name,
        storedFile.contentType,
        storedFile.file.size,
        storedFile.storageKey
      )
    );
    await env.gyan_registry.batch(
      fileStatements
    );
    await addStoredBytes(
      env,
      totalFileSize
    );
    const notification = await sendPrintRequestEmail(
      env,
      {
        shopName: shop.name,
        shopEmail: shop.email_address ?? "",
        orderNumber: createdRequest.order_number,
        customerName,
        phoneNumber,
        whatsAppNumber: whatsAppNumber || phoneNumber,
        emailAddress,
        fileNames: storedFiles.map(
          (storedFile) => storedFile.file.name
        ),
        estimatedPages,
        copies,
        colorMode,
        printSides,
        paperSize,
        instructions,
        estimatedAmountRupees
      }
    );
    return createJsonResponse4(
      {
        order: {
          orderNumber: createdRequest.order_number,
          status: createdRequest.status,
          createdAt: createdRequest.created_at,
          fileCount: storedFiles.length
        },
        storage: {
          state: storageCapacity.warningActive ? "warning" : "normal",
          warningActive: storageCapacity.warningActive,
          projectedBytes: storageCapacity.projectedBytes,
          stopBytes: storageCapacity.stopBytes
        },
        notification: {
          emailSent: notification.sent,
          emailId: notification.emailId,
          reason: notification.reason
        }
      },
      201
    );
  } catch (error) {
    console.error(
      "Print request creation failed:",
      error
    );
    await deleteStoredFiles(
      env,
      storedFiles
    );
    if (createdRequest) {
      await deletePrintRequest(
        env,
        createdRequest.id
      );
    }
    return createJsonResponse4(
      {
        error: "The print request or its files could not be stored."
      },
      500
    );
  }
}
__name(handleCreatePrintRequest, "handleCreatePrintRequest");
async function handlePrintRequestsRoute(request, env, url) {
  const routeMatch = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/print-requests$/
  );
  if (!routeMatch) {
    return null;
  }
  if (request.method !== "POST") {
    return createJsonResponse4(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const shopCode = normalizeShopCode2(
    routeMatch[1]
  );
  if (!shopCode) {
    return createJsonResponse4(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  return handleCreatePrintRequest(
    request,
    env,
    shopCode
  );
}
__name(handlePrintRequestsRoute, "handlePrintRequestsRoute");

// worker/serviceCatalog.ts
init_modules_watch_stub();
function createJsonResponse5(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse5, "createJsonResponse");
function normalizeShopCode3(value) {
  const normalized = value.trim().toUpperCase();
  if (!/^[A-Z0-9]{4}$/.test(
    normalized
  )) {
    return null;
  }
  return normalized;
}
__name(normalizeShopCode3, "normalizeShopCode");
function mapServiceRow(row) {
  return {
    id: row.id,
    code: row.service_code,
    type: row.service_type,
    category: row.category,
    subCategory: row.sub_category,
    name: row.display_name ?? row.name,
    catalogName: row.name,
    description: row.description_override ?? row.description ?? "",
    icon: row.icon_override ?? row.icon ?? "\u{1F9E9}",
    color: row.color_override ?? row.color ?? "#607d8b",
    workflowType: row.workflow_type,
    enabled: Boolean(
      row.effective_enabled
    ),
    priceType: row.price_type ?? "contact",
    priceAmountPaise: row.price_amount_paise,
    priceNote: row.price_note ?? "",
    sortOrder: Number(
      row.effective_sort_order
    ),
    homepageOrder: row.homepage_order == null ? null : Number(
      row.homepage_order
    ),
    custom: row.service_type === "custom"
  };
}
__name(mapServiceRow, "mapServiceRow");
async function getGlobalServices(env) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            s.id,
            s.service_code,
            s.service_type,

            s.category,
            s.sub_category,

            s.name,
            s.description,

            s.icon,
            s.color,

            s.workflow_type,
            s.owner_shop_code,

            s.homepage_order,

            CAST(
              s.enabled AS INTEGER
            ) AS effective_enabled,

            s.sort_order
              AS effective_sort_order,

            NULL AS display_name,
            NULL AS description_override,
            NULL AS icon_override,
            NULL AS color_override,

            'contact' AS price_type,
            NULL AS price_amount_paise,
            NULL AS price_note

          FROM services s

          WHERE
            s.service_type =
              'system'

          ORDER BY
            s.category ASC,

            CASE
              WHEN s.homepage_order IS NULL
                THEN 1
              ELSE 0
            END ASC,

            s.homepage_order ASC,
            s.sort_order ASC,
            s.name ASC
        `
  ).all();
  return createJsonResponse5({
    services: result.results.map(
      mapServiceRow
    )
  });
}
__name(getGlobalServices, "getGlobalServices");
async function getShopServices(env, rawShopCode) {
  const shopCode = normalizeShopCode3(
    rawShopCode
  );
  if (!shopCode) {
    return createJsonResponse5(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  const shop = await env.gyan_registry.prepare(
    `
          SELECT code
          FROM shops
          WHERE code = ?
          LIMIT 1
        `
  ).bind(shopCode).first();
  if (!shop) {
    return createJsonResponse5(
      {
        error: "Shop not found."
      },
      404
    );
  }
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            s.id,
            s.service_code,
            s.service_type,

            s.category,
            s.sub_category,

            s.name,
            s.description,

            s.icon,
            s.color,

            s.workflow_type,
            s.owner_shop_code,

            s.homepage_order,

            CAST(
              COALESCE(
                ss.enabled,
                s.enabled
              )
              AS INTEGER
            ) AS effective_enabled,

            COALESCE(
              ss.sort_order,
              s.sort_order
            ) AS effective_sort_order,

            ss.display_name,
            ss.description_override,
            ss.icon_override,
            ss.color_override,

            COALESCE(
              ss.price_type,
              'contact'
            ) AS price_type,

            ss.price_amount_paise,
            ss.price_note

          FROM services s

          LEFT JOIN shop_services ss
            ON ss.service_id = s.id
            AND ss.shop_code = ?

          WHERE
            s.service_type =
              'system'

            OR s.owner_shop_code = ?

          ORDER BY
            s.category ASC,

            CASE
              WHEN s.homepage_order IS NULL
                THEN 1
              ELSE 0
            END ASC,

            s.homepage_order ASC,
            effective_sort_order ASC,
            s.name ASC
        `
  ).bind(
    shopCode,
    shopCode
  ).all();
  return createJsonResponse5({
    shopCode,
    services: result.results.map(
      mapServiceRow
    )
  });
}
__name(getShopServices, "getShopServices");
async function handleServiceCatalogRoute(request, env, url) {
  if (request.method === "GET" && url.pathname === "/api/services") {
    return getGlobalServices(env);
  }
  const shopServicesMatch = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/services$/
  );
  if (request.method === "GET" && shopServicesMatch) {
    return getShopServices(
      env,
      shopServicesMatch[1]
    );
  }
  return null;
}
__name(handleServiceCatalogRoute, "handleServiceCatalogRoute");

// worker/adminStorage.ts
init_modules_watch_stub();
function createJsonResponse6(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse6, "createJsonResponse");
async function requireAdmin3(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (session) {
    return null;
  }
  return createJsonResponse6(
    {
      error: "Administrator authentication is required."
    },
    401
  );
}
__name(requireAdmin3, "requireAdmin");
async function loadStorageSettings(env) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            setting_key,
            setting_value
          FROM system_settings
          WHERE setting_key IN (
            'storage_warning_bytes',
            'storage_stop_bytes',
            'storage_used_bytes',
            'storage_warning_active',
            'uploads_enabled',
            'file_retention_days'
          )
        `
  ).all();
  const values = new Map(
    result.results.map(
      (row) => [
        row.setting_key,
        row.setting_value
      ]
    )
  );
  const warningBytes = Number(
    values.get(
      "storage_warning_bytes"
    ) ?? 0
  );
  const stopBytes = Number(
    values.get(
      "storage_stop_bytes"
    ) ?? 0
  );
  const usedBytes = Number(
    values.get(
      "storage_used_bytes"
    ) ?? 0
  );
  const uploadsEnabled = values.get(
    "uploads_enabled"
  ) !== "false";
  const warningActive = values.get(
    "storage_warning_active"
  ) === "true";
  const state = !uploadsEnabled || usedBytes >= stopBytes ? "stopped" : warningActive || usedBytes >= warningBytes ? "warning" : "normal";
  return {
    state,
    warningBytes,
    stopBytes,
    usedBytes,
    uploadsEnabled,
    retentionDays: Number(
      values.get(
        "file_retention_days"
      ) ?? 15
    )
  };
}
__name(loadStorageSettings, "loadStorageSettings");
async function handleGetStorage(request, env) {
  const unauthorized = await requireAdmin3(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  return createJsonResponse6({
    storage: await loadStorageSettings(
      env
    )
  });
}
__name(handleGetStorage, "handleGetStorage");
async function handleUpdateStorage(request, env) {
  const unauthorized = await requireAdmin3(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse6(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const warningMegabytes = Number(
    body.warningMegabytes
  );
  const stopMegabytes = Number(
    body.stopMegabytes
  );
  if (!Number.isFinite(
    warningMegabytes
  ) || !Number.isFinite(
    stopMegabytes
  ) || warningMegabytes <= 0 || stopMegabytes <= 0 || warningMegabytes >= stopMegabytes) {
    return createJsonResponse6(
      {
        error: "The warning limit must be greater than zero and lower than the stop limit."
      },
      400
    );
  }
  const warningBytes = Math.round(
    warningMegabytes * 1024 * 1024
  );
  const stopBytes = Math.round(
    stopMegabytes * 1024 * 1024
  );
  const current = await loadStorageSettings(
    env
  );
  const warningActive = current.usedBytes >= warningBytes;
  const uploadsEnabled = current.usedBytes < stopBytes;
  await env.gyan_registry.batch([
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'storage_warning_bytes'
        `
    ).bind(
      String(
        warningBytes
      )
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'storage_stop_bytes'
        `
    ).bind(
      String(
        stopBytes
      )
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'storage_warning_active'
        `
    ).bind(
      warningActive ? "true" : "false"
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'uploads_enabled'
        `
    ).bind(
      uploadsEnabled ? "true" : "false"
    )
  ]);
  return createJsonResponse6({
    message: "Storage limits updated.",
    storage: await loadStorageSettings(
      env
    )
  });
}
__name(handleUpdateStorage, "handleUpdateStorage");
async function handleAdminStorageRoute(request, env, url) {
  if (url.pathname !== "/api/admin/storage") {
    return null;
  }
  if (request.method === "GET") {
    return handleGetStorage(
      request,
      env
    );
  }
  if (request.method === "PUT") {
    return handleUpdateStorage(
      request,
      env
    );
  }
  return createJsonResponse6(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminStorageRoute, "handleAdminStorageRoute");

// worker/adminServiceForms.ts
init_modules_watch_stub();
var MAX_SECTIONS_PER_SERVICE = 10;
var MAX_FIELDS_PER_SECTION = 15;
var allowedFieldTypes = /* @__PURE__ */ new Set([
  "text",
  "textarea",
  "number",
  "email",
  "tel",
  "date",
  "select",
  "radio",
  "checkbox",
  "checkbox-group",
  "file"
]);
var allowedRequirements = /* @__PURE__ */ new Set([
  "mandatory",
  "optional",
  "hidden"
]);
var allowedVisibility = /* @__PURE__ */ new Set([
  "visible",
  "hidden"
]);
function createJsonResponse7(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse7, "createJsonResponse");
async function requireAdmin4(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (session) {
    return null;
  }
  return createJsonResponse7(
    {
      error: "Administrator authentication is required."
    },
    401
  );
}
__name(requireAdmin4, "requireAdmin");
function normalizeServiceCode3(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode3, "normalizeServiceCode");
function normalizeKey(value, maximumLength = 50) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toLowerCase().replace(
    /[^a-z0-9_]+/g,
    "_"
  ).replace(
    /^_+|_+$/g,
    ""
  );
  if (!normalized || normalized.length > maximumLength) {
    return null;
  }
  return normalized;
}
__name(normalizeKey, "normalizeKey");
function normalizeRequiredText2(value, maximumLength) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  if (!normalized || normalized.length > maximumLength) {
    return null;
  }
  return normalized;
}
__name(normalizeRequiredText2, "normalizeRequiredText");
function normalizeOptionalText2(value, maximumLength) {
  if (value === null || value === void 0 || value === "") {
    return null;
  }
  if (typeof value !== "string") {
    return "invalid";
  }
  const normalized = value.trim();
  if (!normalized) {
    return null;
  }
  if (normalized.length > maximumLength) {
    return "invalid";
  }
  return normalized;
}
__name(normalizeOptionalText2, "normalizeOptionalText");
function normalizeBoolean(value, fallback) {
  return typeof value === "boolean" ? value : fallback;
}
__name(normalizeBoolean, "normalizeBoolean");
function normalizeSortOrder3(value, fallback) {
  if (value === void 0 || value === null || value === "") {
    return fallback;
  }
  if (typeof value !== "number" || !Number.isInteger(value) || value < 0 || value > 9999) {
    return null;
  }
  return value;
}
__name(normalizeSortOrder3, "normalizeSortOrder");
function normalizeJsonValue(value, maximumLength) {
  if (value === null || value === void 0 || value === "") {
    return null;
  }
  try {
    const json = JSON.stringify(value);
    if (json.length > maximumLength) {
      return "invalid";
    }
    return json;
  } catch {
    return "invalid";
  }
}
__name(normalizeJsonValue, "normalizeJsonValue");
function safelyParseJson(value) {
  if (!value) {
    return null;
  }
  try {
    return JSON.parse(value);
  } catch {
    return null;
  }
}
__name(safelyParseJson, "safelyParseJson");
async function loadService(env, serviceCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          id,
          service_code,
          name,
          category,
          sub_category

        FROM services

        WHERE service_code = ?

        LIMIT 1
      `
  ).bind(serviceCode).first();
}
__name(loadService, "loadService");
async function loadServiceForm(env, serviceId) {
  const sectionsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key,
            label,
            description,
            visibility,
            include_in_shop_email,
            include_in_customer_email,
            sort_order

          FROM service_sections

          WHERE service_id = ?

          ORDER BY
            sort_order ASC,
            id ASC
        `
  ).bind(serviceId).all();
  if (sectionsResult.results.length === 0) {
    return [];
  }
  const sectionIds = sectionsResult.results.map(
    (section) => section.id
  );
  const placeholders = sectionIds.map(() => "?").join(", ");
  const fieldsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            placeholder,
            help_text,
            default_value,
            options_json,
            validation_json,
            email_label,
            include_in_shop_email,
            include_in_customer_email,
            include_in_request_view,
            sort_order

          FROM service_fields

          WHERE section_id IN (
            ${placeholders}
          )

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `
  ).bind(...sectionIds).all();
  const fieldsBySection = /* @__PURE__ */ new Map();
  for (const field of fieldsResult.results) {
    const current = fieldsBySection.get(
      field.section_id
    ) ?? [];
    current.push(field);
    fieldsBySection.set(
      field.section_id,
      current
    );
  }
  return sectionsResult.results.map(
    (section) => ({
      id: section.id,
      key: section.section_key,
      label: section.label,
      description: section.description ?? "",
      visibility: section.visibility,
      includeInShopEmail: Boolean(
        section.include_in_shop_email
      ),
      includeInCustomerEmail: Boolean(
        section.include_in_customer_email
      ),
      sortOrder: section.sort_order,
      fields: (fieldsBySection.get(
        section.id
      ) ?? []).map(
        (field) => ({
          id: field.id,
          key: field.field_key,
          label: field.label,
          type: field.field_type,
          requirement: field.requirement,
          placeholder: field.placeholder ?? "",
          helpText: field.help_text ?? "",
          defaultValue: field.default_value ?? "",
          options: safelyParseJson(
            field.options_json
          ),
          validation: safelyParseJson(
            field.validation_json
          ),
          emailLabel: field.email_label ?? "",
          includeInShopEmail: Boolean(
            field.include_in_shop_email
          ),
          includeInCustomerEmail: Boolean(
            field.include_in_customer_email
          ),
          includeInRequestView: Boolean(
            field.include_in_request_view
          ),
          sortOrder: field.sort_order
        })
      )
    })
  );
}
__name(loadServiceForm, "loadServiceForm");
function normalizeField(rawField, fallbackSortOrder) {
  const key = normalizeKey(
    rawField.key
  );
  const label = normalizeRequiredText2(
    rawField.label,
    150
  );
  const type = typeof rawField.type === "string" && allowedFieldTypes.has(
    rawField.type
  ) ? rawField.type : null;
  const requirement = typeof rawField.requirement === "string" && allowedRequirements.has(
    rawField.requirement
  ) ? rawField.requirement : null;
  const placeholder = normalizeOptionalText2(
    rawField.placeholder,
    250
  );
  const helpText = normalizeOptionalText2(
    rawField.helpText,
    500
  );
  const defaultValue = normalizeOptionalText2(
    rawField.defaultValue,
    500
  );
  const emailLabel = normalizeOptionalText2(
    rawField.emailLabel,
    150
  );
  const optionsJson = normalizeJsonValue(
    rawField.options,
    1e4
  );
  const validationJson = normalizeJsonValue(
    rawField.validation,
    5e3
  );
  const sortOrder = normalizeSortOrder3(
    rawField.sortOrder,
    fallbackSortOrder
  );
  if (!key || !label || !type || !requirement || placeholder === "invalid" || helpText === "invalid" || defaultValue === "invalid" || emailLabel === "invalid" || optionsJson === "invalid" || validationJson === "invalid" || sortOrder === null) {
    return null;
  }
  return {
    key,
    label,
    type,
    requirement,
    placeholder,
    helpText,
    defaultValue,
    optionsJson,
    validationJson,
    emailLabel,
    includeInShopEmail: normalizeBoolean(
      rawField.includeInShopEmail,
      true
    ),
    includeInCustomerEmail: normalizeBoolean(
      rawField.includeInCustomerEmail,
      true
    ),
    includeInRequestView: normalizeBoolean(
      rawField.includeInRequestView,
      true
    ),
    sortOrder
  };
}
__name(normalizeField, "normalizeField");
function normalizeSection(rawSection, fallbackSortOrder) {
  const key = normalizeKey(
    rawSection.key
  );
  const label = normalizeRequiredText2(
    rawSection.label,
    150
  );
  const description = normalizeOptionalText2(
    rawSection.description,
    500
  );
  const visibility = typeof rawSection.visibility === "string" && allowedVisibility.has(
    rawSection.visibility
  ) ? rawSection.visibility : null;
  const sortOrder = normalizeSortOrder3(
    rawSection.sortOrder,
    fallbackSortOrder
  );
  if (!key || !label || description === "invalid" || !visibility || sortOrder === null || !Array.isArray(
    rawSection.fields
  ) || rawSection.fields.length > MAX_FIELDS_PER_SECTION) {
    return null;
  }
  const fields = [];
  const fieldKeys = /* @__PURE__ */ new Set();
  for (let index = 0; index < rawSection.fields.length; index += 1) {
    const rawField = rawSection.fields[index];
    if (typeof rawField !== "object" || rawField === null) {
      return null;
    }
    const normalizedField = normalizeField(
      rawField,
      (index + 1) * 10
    );
    if (!normalizedField || fieldKeys.has(
      normalizedField.key
    )) {
      return null;
    }
    fieldKeys.add(
      normalizedField.key
    );
    fields.push(
      normalizedField
    );
  }
  return {
    key,
    label,
    description,
    visibility,
    includeInShopEmail: normalizeBoolean(
      rawSection.includeInShopEmail,
      true
    ),
    includeInCustomerEmail: normalizeBoolean(
      rawSection.includeInCustomerEmail,
      true
    ),
    sortOrder,
    fields
  };
}
__name(normalizeSection, "normalizeSection");
async function handleGetServiceForm(request, env, serviceCode) {
  const unauthorized = await requireAdmin4(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const service = await loadService(
    env,
    serviceCode
  );
  if (!service) {
    return createJsonResponse7(
      {
        error: "Service not found."
      },
      404
    );
  }
  return createJsonResponse7({
    service: {
      id: service.id,
      code: service.service_code,
      name: service.name,
      category: service.category,
      subCategory: service.sub_category
    },
    limits: {
      maximumSections: MAX_SECTIONS_PER_SERVICE,
      maximumFieldsPerSection: MAX_FIELDS_PER_SECTION
    },
    sections: await loadServiceForm(
      env,
      service.id
    )
  });
}
__name(handleGetServiceForm, "handleGetServiceForm");
async function handleUpdateServiceForm(request, env, serviceCode) {
  const unauthorized = await requireAdmin4(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const service = await loadService(
    env,
    serviceCode
  );
  if (!service) {
    return createJsonResponse7(
      {
        error: "Service not found."
      },
      404
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse7(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (!Array.isArray(
    body.sections
  ) || body.sections.length > MAX_SECTIONS_PER_SERVICE) {
    return createJsonResponse7(
      {
        error: `A service may contain up to ${MAX_SECTIONS_PER_SERVICE} sections.`
      },
      400
    );
  }
  const sections = [];
  const sectionKeys = /* @__PURE__ */ new Set();
  for (let index = 0; index < body.sections.length; index += 1) {
    const rawSection = body.sections[index];
    if (typeof rawSection !== "object" || rawSection === null) {
      return createJsonResponse7(
        {
          error: "Each section must be an object."
        },
        400
      );
    }
    const normalizedSection = normalizeSection(
      rawSection,
      (index + 1) * 10
    );
    if (!normalizedSection) {
      return createJsonResponse7(
        {
          error: `Section ${index + 1} contains invalid information or exceeds the field limit.`
        },
        400
      );
    }
    if (sectionKeys.has(
      normalizedSection.key
    )) {
      return createJsonResponse7(
        {
          error: `Section key "${normalizedSection.key}" was used more than once.`
        },
        400
      );
    }
    sectionKeys.add(
      normalizedSection.key
    );
    sections.push(
      normalizedSection
    );
  }
  const statements = [];
  statements.push(
    env.gyan_registry.prepare(
      `
          DELETE FROM
            service_sections

          WHERE service_id = ?
        `
    ).bind(service.id)
  );
  for (const section of sections) {
    statements.push(
      env.gyan_registry.prepare(
        `
            INSERT INTO
              service_sections (
                service_id,
                section_key,
                label,
                description,
                visibility,
                include_in_shop_email,
                include_in_customer_email,
                sort_order,
                updated_at
              )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              CURRENT_TIMESTAMP
            )
          `
      ).bind(
        service.id,
        section.key,
        section.label,
        section.description,
        section.visibility,
        section.includeInShopEmail ? 1 : 0,
        section.includeInCustomerEmail ? 1 : 0,
        section.sortOrder
      )
    );
  }
  await env.gyan_registry.batch(
    statements
  );
  const insertedSections = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key

          FROM service_sections

          WHERE service_id = ?
        `
  ).bind(service.id).all();
  const sectionIdMap = new Map(
    insertedSections.results.map(
      (row) => [
        row.section_key,
        row.id
      ]
    )
  );
  const fieldStatements = [];
  for (const section of sections) {
    const sectionId = sectionIdMap.get(
      section.key
    );
    if (!sectionId) {
      return createJsonResponse7(
        {
          error: "The service sections were saved, but one section could not be reloaded."
        },
        500
      );
    }
    for (const field of section.fields) {
      fieldStatements.push(
        env.gyan_registry.prepare(
          `
              INSERT INTO
                service_fields (
                  section_id,
                  field_key,
                  label,
                  field_type,
                  requirement,
                  placeholder,
                  help_text,
                  default_value,
                  options_json,
                  validation_json,
                  email_label,
                  include_in_shop_email,
                  include_in_customer_email,
                  include_in_request_view,
                  sort_order,
                  updated_at
                )
              VALUES (
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                CURRENT_TIMESTAMP
              )
            `
        ).bind(
          sectionId,
          field.key,
          field.label,
          field.type,
          field.requirement,
          field.placeholder,
          field.helpText,
          field.defaultValue,
          field.optionsJson,
          field.validationJson,
          field.emailLabel,
          field.includeInShopEmail ? 1 : 0,
          field.includeInCustomerEmail ? 1 : 0,
          field.includeInRequestView ? 1 : 0,
          field.sortOrder
        )
      );
    }
  }
  if (fieldStatements.length > 0) {
    await env.gyan_registry.batch(
      fieldStatements
    );
  }
  return createJsonResponse7({
    message: "Service form configuration saved.",
    service: {
      id: service.id,
      code: service.service_code,
      name: service.name
    },
    sections: await loadServiceForm(
      env,
      service.id
    )
  });
}
__name(handleUpdateServiceForm, "handleUpdateServiceForm");
async function handleAdminServiceFormsRoute(request, env, url) {
  const match = url.pathname.match(
    /^\/api\/admin\/services\/([A-Za-z0-9_]{2,50})\/form$/
  );
  if (!match) {
    return null;
  }
  const serviceCode = normalizeServiceCode3(
    match[1]
  );
  if (!serviceCode) {
    return createJsonResponse7(
      {
        error: "Invalid service code."
      },
      400
    );
  }
  if (request.method === "GET") {
    return handleGetServiceForm(
      request,
      env,
      serviceCode
    );
  }
  if (request.method === "PUT") {
    return handleUpdateServiceForm(
      request,
      env,
      serviceCode
    );
  }
  return createJsonResponse7(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminServiceFormsRoute, "handleAdminServiceFormsRoute");

// worker/serviceForms.ts
init_modules_watch_stub();
function createJsonResponse8(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse8, "createJsonResponse");
function normalizeShopCode4(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode4, "normalizeShopCode");
function normalizeServiceCode4(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode4, "normalizeServiceCode");
function safelyParseJson2(value) {
  if (!value) {
    return null;
  }
  try {
    return JSON.parse(value);
  } catch {
    return null;
  }
}
__name(safelyParseJson2, "safelyParseJson");
async function loadShop2(env, shopCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          status

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(shopCode).first();
}
__name(loadShop2, "loadShop");
async function loadService2(env, shopCode, serviceCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          s.id,
          s.service_code,
          s.name,
          s.description,
          s.icon,
          s.color,
          s.category,
          s.sub_category,
          s.workflow_type,

          CAST(
            s.enabled AS INTEGER
          ) AS global_enabled,

          ss.enabled
            AS shop_enabled

        FROM services s

        LEFT JOIN shop_services ss
          ON ss.service_id = s.id
          AND ss.shop_code = ?

        WHERE
          s.service_code = ?
          AND s.service_type = 'system'

        LIMIT 1
      `
  ).bind(
    shopCode,
    serviceCode
  ).first();
}
__name(loadService2, "loadService");
async function loadPublicSections(env, serviceId) {
  const sectionsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key,
            label,
            description,
            sort_order

          FROM service_sections

          WHERE
            service_id = ?
            AND visibility = 'visible'

          ORDER BY
            sort_order ASC,
            id ASC
        `
  ).bind(serviceId).all();
  if (sectionsResult.results.length === 0) {
    return [];
  }
  const sectionIds = sectionsResult.results.map(
    (section) => section.id
  );
  const placeholders = sectionIds.map(() => "?").join(", ");
  const fieldsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            placeholder,
            help_text,
            default_value,
            options_json,
            validation_json,
            sort_order

          FROM service_fields

          WHERE
            section_id IN (
              ${placeholders}
            )
            AND requirement != 'hidden'

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `
  ).bind(
    ...sectionIds
  ).all();
  const fieldsBySection = /* @__PURE__ */ new Map();
  for (const field of fieldsResult.results) {
    const current = fieldsBySection.get(
      field.section_id
    ) ?? [];
    current.push(field);
    fieldsBySection.set(
      field.section_id,
      current
    );
  }
  return sectionsResult.results.map(
    (section) => ({
      key: section.section_key,
      label: section.label,
      description: section.description ?? "",
      sortOrder: section.sort_order,
      fields: (fieldsBySection.get(
        section.id
      ) ?? []).map(
        (field) => ({
          key: field.field_key,
          label: field.label,
          type: field.field_type,
          required: field.requirement === "mandatory",
          placeholder: field.placeholder ?? "",
          helpText: field.help_text ?? "",
          defaultValue: field.default_value ?? "",
          options: safelyParseJson2(
            field.options_json
          ) ?? [],
          validation: safelyParseJson2(
            field.validation_json
          ) ?? {},
          sortOrder: field.sort_order
        })
      )
    })
  ).filter(
    (section) => section.fields.length > 0
  );
}
__name(loadPublicSections, "loadPublicSections");
async function handleGetPublicServiceForm(env, shopCode, serviceCode) {
  const shop = await loadShop2(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse8(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse8(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  const service = await loadService2(
    env,
    shopCode,
    serviceCode
  );
  if (!service) {
    return createJsonResponse8(
      {
        error: "Service not found."
      },
      404
    );
  }
  const effectiveEnabled = service.shop_enabled === null ? Boolean(
    service.global_enabled
  ) : Boolean(
    service.shop_enabled
  );
  if (!effectiveEnabled) {
    return createJsonResponse8(
      {
        error: "This service is not currently available at the selected shop."
      },
      403
    );
  }
  const sections = await loadPublicSections(
    env,
    service.id
  );
  return createJsonResponse8({
    shop: {
      code: shop.code,
      name: shop.name
    },
    service: {
      code: service.service_code,
      name: service.name,
      description: service.description ?? "",
      icon: service.icon ?? "\u{1F9E9}",
      color: service.color ?? "#607d8b",
      category: service.category,
      subCategory: service.sub_category,
      workflowType: service.workflow_type
    },
    form: {
      sections,
      hasConfiguration: sections.length > 0
    }
  });
}
__name(handleGetPublicServiceForm, "handleGetPublicServiceForm");
async function handleServiceFormsRoute(request, env, url) {
  const match = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/services\/([A-Za-z0-9_]{2,50})\/form$/
  );
  if (!match) {
    return null;
  }
  if (request.method !== "GET") {
    return createJsonResponse8(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const shopCode = normalizeShopCode4(
    match[1]
  );
  const serviceCode = normalizeServiceCode4(
    match[2]
  );
  if (!shopCode || !serviceCode) {
    return createJsonResponse8(
      {
        error: "Invalid shop or service code."
      },
      400
    );
  }
  return handleGetPublicServiceForm(
    env,
    shopCode,
    serviceCode
  );
}
__name(handleServiceFormsRoute, "handleServiceFormsRoute");

// worker/serviceRequests.ts
init_modules_watch_stub();

// worker/serviceRequestNotifications.ts
init_modules_watch_stub();

// worker/emailTemplates/serviceRequestEmail.ts
init_modules_watch_stub();
function escapeHtml2(value) {
  return value.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;").replaceAll("'", "&#039;");
}
__name(escapeHtml2, "escapeHtml");
function formatFileSize(bytes) {
  if (bytes < 1024) {
    return `${bytes} B`;
  }
  if (bytes < 1024 * 1024) {
    return `${(bytes / 1024).toFixed(1)} KB`;
  }
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}
__name(formatFileSize, "formatFileSize");
function formatDate(value) {
  return new Intl.DateTimeFormat(
    "en-IN",
    {
      year: "numeric",
      month: "long",
      day: "numeric",
      timeZone: "UTC"
    }
  ).format(value);
}
__name(formatDate, "formatDate");
function calculateExpirationDate(createdAt, retentionDays) {
  const createdDate = new Date(createdAt);
  const safeCreatedDate = Number.isNaN(
    createdDate.getTime()
  ) ? /* @__PURE__ */ new Date() : createdDate;
  return new Date(
    safeCreatedDate.getTime() + retentionDays * 24 * 60 * 60 * 1e3
  );
}
__name(calculateExpirationDate, "calculateExpirationDate");
function renderCustomerRows(customer) {
  const rows = [];
  if (customer.name) {
    rows.push({
      label: "Name",
      value: customer.name
    });
  }
  if (customer.phone) {
    rows.push({
      label: "Mobile",
      value: customer.phone
    });
  }
  if (customer.whatsApp) {
    rows.push({
      label: "WhatsApp",
      value: customer.whatsApp
    });
  }
  if (customer.email) {
    rows.push({
      label: "Email",
      value: customer.email
    });
  }
  return rows;
}
__name(renderCustomerRows, "renderCustomerRows");
function hasMeaningfulValue(value) {
  const normalized = value.trim().toLowerCase();
  return normalized.length > 0 && normalized !== "not provided" && normalized !== "none selected" && normalized !== "n/a" && normalized !== "na";
}
__name(hasMeaningfulValue, "hasMeaningfulValue");
function meaningfulRows(rows) {
  return rows.filter(
    (row) => hasMeaningfulValue(
      row.value
    )
  );
}
__name(meaningfulRows, "meaningfulRows");
function renderHtmlRows(rows) {
  return rows.map(
    (row) => `
        <tr>
          <td
            style="
              width:38%;
              padding:7px 8px 7px 0;
              color:#6b7b8d;
              vertical-align:top;
            "
          >
            ${escapeHtml2(row.label)}
          </td>

          <td
            style="
              padding:7px 0;
              color:#17365d;
              font-weight:600;
              vertical-align:top;
              overflow-wrap:anywhere;
            "
          >
            ${escapeHtml2(row.value)}
          </td>
        </tr>
      `
  ).join("");
}
__name(renderHtmlRows, "renderHtmlRows");
function renderHtmlSection(section) {
  const rows = meaningfulRows(
    section.rows
  );
  if (rows.length === 0) {
    return "";
  }
  return `
    <section
      style="
        margin-top:18px;
        padding:16px;
        background:#ffffff;
        border:1px solid #dbe5ef;
        border-radius:10px;
      "
    >
      <h2
        style="
          margin:0 0 8px;
          color:#17365d;
          font-size:16px;
        "
      >
        ${escapeHtml2(section.label)}
      </h2>

      <table
        role="presentation"
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        ${renderHtmlRows(rows)}
      </table>
    </section>
  `;
}
__name(renderHtmlSection, "renderHtmlSection");
function renderTextSection(section) {
  const rows = meaningfulRows(
    section.rows
  );
  if (rows.length === 0) {
    return "";
  }
  return [
    section.label,
    "-".repeat(
      section.label.length
    ),
    ...rows.map(
      (row) => `${row.label}: ${row.value}`
    ),
    ""
  ].join("\n");
}
__name(renderTextSection, "renderTextSection");
function renderActions(actions) {
  if (!actions || actions.length === 0) {
    return "";
  }
  return `
    <div
      style="
        margin-top:20px;
      "
    >
      ${actions.map(
    (action) => `
            <a
              href="${escapeHtml2(action.url)}"
              style="
                display:inline-block;
                min-width:130px;
                margin:0 8px 8px 0;
                padding:11px 16px;
                border:1px solid ${action.primary ? "#145da0" : "#b8c7d8"};
                border-radius:8px;
                background:${action.primary ? "#1565c0" : "#ffffff"};
                color:${action.primary ? "#ffffff" : "#24415f"};
                text-decoration:none;
                font-size:13px;
                font-weight:700;
                text-align:center;
              "
            >
              ${escapeHtml2(action.label)}
            </a>
          `
  ).join("")}
    </div>
  `;
}
__name(renderActions, "renderActions");
function formatStatus(value) {
  const normalized = value.trim().replace(
    /[_-]+/g,
    " "
  );
  return normalized.replace(
    /\b\w/g,
    (character) => character.toUpperCase()
  );
}
__name(formatStatus, "formatStatus");
function getRecipientSubjectLabel(recipient) {
  if (recipient === "shop") {
    return "Shop";
  }
  if (recipient === "admin") {
    return "Admin";
  }
  return "User";
}
__name(getRecipientSubjectLabel, "getRecipientSubjectLabel");
function getRecipientCopy(input) {
  const status = formatStatus(
    input.status
  );
  const subject = `${getRecipientSubjectLabel(
    input.recipient
  )} - ${input.serviceName} - ${status} - ${input.requestNumber}`;
  if (input.recipient === "shop") {
    return {
      eyebrow: "GYAN SHOP REQUEST",
      title: `${input.serviceName} request`,
      introduction: `A ${input.serviceName} request has been assigned to ${input.shopName}. Please review it and contact the customer.`,
      subject
    };
  }
  if (input.recipient === "admin") {
    return {
      eyebrow: "GYAN ADMIN",
      title: `${input.serviceName} request`,
      introduction: `A ${input.serviceName} request was submitted and routed to ${input.shopName}.`,
      subject
    };
  }
  return {
    eyebrow: "GYAN SERVICE",
    title: `${input.serviceName} request`,
    introduction: `Your ${input.serviceName} request has been received. A GYAN team member will review it and contact you by phone, WhatsApp, or email.`,
    subject
  };
}
__name(getRecipientCopy, "getRecipientCopy");
function renderServiceRequestEmail(input) {
  const expirationDate = calculateExpirationDate(
    input.createdAt,
    input.retentionDays
  );
  const expirationText = formatDate(
    expirationDate
  );
  const copy = getRecipientCopy(
    input
  );
  const customerRows = meaningfulRows(
    renderCustomerRows(
      input.customer
    )
  );
  const filesHtml = input.files.length > 0 ? `
        <section
          style="
            margin-top:18px;
            padding:16px;
            background:#ffffff;
            border:1px solid #dbe5ef;
            border-radius:10px;
          "
        >
          <h2
            style="
              margin:0 0 8px;
              color:#17365d;
              font-size:16px;
            "
          >
            Files
          </h2>

          <ul
            style="
              margin:0;
              padding-left:20px;
              color:#17365d;
            "
          >
            ${input.files.map(
    (file) => `
                  <li style="margin:6px 0;">
                    ${escapeHtml2(file.name)}
                    <span
                      style="
                        color:#6b7b8d;
                        font-size:12px;
                      "
                    >
                      (${escapeHtml2(
      formatFileSize(
        file.size
      )
    )})
                    </span>
                  </li>
                `
  ).join("")}
          </ul>
        </section>
      ` : "";
  const filesText = input.files.length > 0 ? [
    "Files",
    "-----",
    ...input.files.map(
      (file) => `${file.name} (${formatFileSize(
        file.size
      )})`
    ),
    ""
  ].join("\n") : "";
  const showCustomerSection = input.recipient !== "customer" && customerRows.length > 0;
  const customerHtml = showCustomerSection ? renderHtmlSection({
    label: "Customer",
    rows: customerRows
  }) : "";
  const customerText = showCustomerSection ? renderTextSection({
    label: "Customer",
    rows: customerRows
  }) : "";
  const configuredSectionsHtml = input.sections.map(
    renderHtmlSection
  ).join("");
  const configuredSectionsText = input.sections.map(
    renderTextSection
  ).join("");
  const html = `
    <!doctype html>
    <html>
      <body
        style="
          margin:0;
          padding:0;
          background:#f4f1eb;
        "
      >
        <div
          style="
            max-width:660px;
            margin:0 auto;
            padding:24px 16px;
          "
        >
          <div
            style="
              overflow:hidden;
              background:#fffdf8;
              border:1px solid #dbe5ef;
              border-radius:14px;
              font-family:Arial,sans-serif;
              line-height:1.5;
            "
          >
            <header
              style="
                padding:14px 16px;
                background:#f4eadc;
                border-bottom:1px solid #ded5c8;
              "
            >
              <table
                role="presentation"
                style="
                  width:100%;
                  border-collapse:collapse;
                "
              >
                <tr>
                  <td
                    style="
                      width:42px;
                      vertical-align:middle;
                      font-size:26px;
                    "
                  >
                    \u{1F4D6}
                  </td>

                  <td
                    style="
                      vertical-align:middle;
                    "
                  >
                    <div
                      style="
                        color:#17365d;
                        font-size:20px;
                        font-weight:800;
                        line-height:1.05;
                      "
                    >
                      GYAN
                    </div>

                    <div
                      style="
                        margin-top:2px;
                        color:#65788c;
                        font-size:11px;
                      "
                    >
                      Your Digital Seva Partner
                    </div>
                  </td>

                  <td
                    style="
                      vertical-align:middle;
                      text-align:right;
                    "
                  >
                    <span
                      style="
                        display:inline-block;
                        padding:6px 9px;
                        border:1px solid #cbd7e4;
                        border-radius:8px;
                        background:#ffffff;
                        color:#35536f;
                        font-size:11px;
                        font-weight:700;
                      "
                    >
                      ${escapeHtml2(
    formatStatus(
      input.status
    )
  )}
                    </span>
                  </td>
                </tr>
              </table>
            </header>

            <div
              style="
                padding:16px 22px 0;
              "
            >
              <div
                style="
                  color:#6b7b8d;
                  font-size:10px;
                  font-weight:700;
                  letter-spacing:1px;
                "
              >
                ${escapeHtml2(copy.eyebrow)}
              </div>

              <h1
                style="
                  margin:4px 0 2px;
                  color:#17365d;
                  font-size:22px;
                "
              >
                ${escapeHtml2(copy.title)}
              </h1>

              <div
                style="
                  color:#6b7b8d;
                  font-size:12px;
                "
              >
                ${escapeHtml2(input.shopName)}
                \xB7
                ${escapeHtml2(input.shopCode)}
              </div>
            </div>

            <main
              style="
                padding:22px;
              "
            >
              <p
                style="
                  margin-top:0;
                  color:#24415f;
                "
              >
                ${escapeHtml2(copy.introduction)}
              </p>

              <div
                style="
                  margin:18px 0;
                  padding:14px;
                  background:#edf6ff;
                  border:1px solid #b9d2ea;
                  border-radius:10px;
                "
              >
                <div
                  style="
                    color:#5d7188;
                    font-size:11px;
                    font-weight:700;
                    letter-spacing:0.7px;
                  "
                >
                  REQUEST NUMBER
                </div>

                <div
                  style="
                    margin-top:4px;
                    color:#17365d;
                    font-family:Consolas,monospace;
                    font-size:17px;
                    font-weight:700;
                    overflow-wrap:anywhere;
                  "
                >
                  ${escapeHtml2(input.requestNumber)}
                </div>

                <div
                  style="
                    margin-top:7px;
                    color:#5d7188;
                    font-size:12px;
                    font-weight:700;
                  "
                >
                  Status:
                  ${escapeHtml2(
    formatStatus(
      input.status
    )
  )}
                </div>
              </div>

              ${renderActions(input.actions)}
              ${customerHtml}
              ${filesHtml}
              ${configuredSectionsHtml}

              <div
                style="
                  margin-top:20px;
                  padding:14px;
                  background:#fff4d8;
                  border:1px solid #d6a346;
                  border-radius:10px;
                  color:#714a12;
                  font-size:13px;
                  line-height:1.5;
                "
              >
                <strong>
                  ${input.retentionDays}-day file-retention policy
                </strong>

                <p style="margin:6px 0 0;">
                  Uploaded files remain available until
                  ${escapeHtml2(expirationText)}.
                  After that date, they are automatically deleted
                  and cannot be recovered through GYAN.
                </p>
              </div>
            </main>

            <footer
              style="
                padding:14px 22px;
                background:#f6f1e8;
                border-top:1px solid #e3d7c6;
                color:#6b7b8d;
                font-size:11px;
                text-align:center;
              "
            >
              This message was generated automatically by GYAN.
            </footer>
          </div>
        </div>
      </body>
    </html>
  `;
  const actionText = input.actions?.length ? [
    "Actions",
    "-------",
    ...input.actions.map(
      (action) => `${action.label}: ${action.url}`
    ),
    ""
  ].join("\n") : "";
  const text = [
    copy.eyebrow,
    copy.title,
    "",
    copy.introduction,
    "",
    `Request number: ${input.requestNumber}`,
    `Shop: ${input.shopName} (${input.shopCode})`,
    "",
    actionText,
    customerText,
    filesText,
    configuredSectionsText,
    `${input.retentionDays}-day file-retention policy`,
    `Uploaded files remain available until ${expirationText}.`,
    "After that date, they are automatically deleted and cannot be recovered through GYAN."
  ].join("\n");
  return {
    subject: copy.subject,
    html,
    text
  };
}
__name(renderServiceRequestEmail, "renderServiceRequestEmail");

// worker/serviceRequestNotifications.ts
var DEFAULT_ADMIN_EMAIL = "admin@gyan.cc";
function normalizeEmail2(value) {
  const normalized = value?.trim().toLowerCase();
  if (!normalized || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    normalized
  )) {
    return null;
  }
  return normalized;
}
__name(normalizeEmail2, "normalizeEmail");
function getSections(input, recipientType) {
  if (recipientType === "shop") {
    return input.sections.shop;
  }
  if (recipientType === "admin") {
    return input.sections.admin ?? input.sections.shop;
  }
  return input.sections.customer;
}
__name(getSections, "getSections");
function getActions(input, recipientType) {
  if (recipientType === "shop") {
    return input.shopActions;
  }
  if (recipientType === "admin") {
    return input.adminActions;
  }
  return input.customerActions;
}
__name(getActions, "getActions");
async function sendEmail(env, recipient, input, adminEmail) {
  if (!env.RESEND_API_KEY) {
    return {
      recipient: recipient.type,
      attempted: false,
      sent: false,
      email: recipient.email,
      reason: "RESEND_API_KEY is not configured."
    };
  }
  const rendered = renderServiceRequestEmail({
    recipient: recipient.type,
    serviceName: input.service.name,
    requestNumber: input.request.requestNumber,
    status: input.request.status,
    shopName: input.shop.name,
    shopCode: input.shop.code,
    customer: input.customer,
    files: input.files,
    sections: getSections(
      input,
      recipient.type
    ),
    actions: getActions(
      input,
      recipient.type
    ),
    createdAt: input.request.createdAt,
    retentionDays: input.retentionDays
  });
  const shouldAuditCopyAdmin = adminEmail && recipient.type !== "admin" && recipient.email !== adminEmail;
  try {
    const response = await fetch(
      "https://api.resend.com/emails",
      {
        method: "POST",
        headers: {
          authorization: `Bearer ${env.RESEND_API_KEY}`,
          "content-type": "application/json"
        },
        body: JSON.stringify({
          from: "GYAN Services <admin@gyan.cc>",
          to: [
            recipient.email
          ],
          bcc: shouldAuditCopyAdmin ? [adminEmail] : void 0,
          subject: rendered.subject,
          html: rendered.html,
          text: rendered.text
        })
      }
    );
    const result = await response.json();
    if (!response.ok) {
      return {
        recipient: recipient.type,
        attempted: true,
        sent: false,
        email: recipient.email,
        reason: result.message ?? result.error?.message ?? "The email provider rejected the message."
      };
    }
    return {
      recipient: recipient.type,
      attempted: true,
      sent: true,
      email: recipient.email,
      emailId: result.id
    };
  } catch (error) {
    return {
      recipient: recipient.type,
      attempted: true,
      sent: false,
      email: recipient.email,
      reason: error instanceof Error ? error.message : "Unexpected notification error."
    };
  }
}
__name(sendEmail, "sendEmail");
async function sendServiceRequestNotifications(env, input) {
  const deliveries = [];
  const shopEmail = normalizeEmail2(
    input.shop.email
  );
  const customerEmail = normalizeEmail2(
    input.customer.email
  );
  const adminEmail = normalizeEmail2(
    input.adminEmail
  ) ?? DEFAULT_ADMIN_EMAIL;
  if (shopEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email: shopEmail,
          type: "shop"
        },
        input,
        adminEmail
      )
    );
  }
  if (customerEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email: customerEmail,
          type: "customer"
        },
        input,
        adminEmail
      )
    );
  }
  if (adminEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email: adminEmail,
          type: "admin"
        },
        input,
        adminEmail
      )
    );
  }
  return Promise.all(
    deliveries
  );
}
__name(sendServiceRequestNotifications, "sendServiceRequestNotifications");

// worker/magicLinks.ts
init_modules_watch_stub();
var TOKEN_VERSION = "v1";
var TEXT_ENCODER = new TextEncoder();
function encodeBase64Url(bytes) {
  let binary = "";
  for (const byte of bytes) {
    binary += String.fromCharCode(
      byte
    );
  }
  return btoa(binary).replaceAll("+", "-").replaceAll("/", "_").replaceAll("=", "");
}
__name(encodeBase64Url, "encodeBase64Url");
function decodeBase64Url(value) {
  try {
    const base64 = value.replaceAll("-", "+").replaceAll("_", "/").padEnd(
      Math.ceil(value.length / 4) * 4,
      "="
    );
    const binary = atob(base64);
    const bytes = new Uint8Array(
      binary.length
    );
    for (let index = 0; index < binary.length; index += 1) {
      bytes[index] = binary.charCodeAt(index);
    }
    return bytes;
  } catch {
    return null;
  }
}
__name(decodeBase64Url, "decodeBase64Url");
function encodeJson(value) {
  return encodeBase64Url(
    TEXT_ENCODER.encode(
      JSON.stringify(value)
    )
  );
}
__name(encodeJson, "encodeJson");
function decodeJson(value) {
  const bytes = decodeBase64Url(value);
  if (!bytes) {
    return null;
  }
  try {
    return JSON.parse(
      new TextDecoder().decode(
        bytes
      )
    );
  } catch {
    return null;
  }
}
__name(decodeJson, "decodeJson");
async function importSigningKey(secret) {
  return crypto.subtle.importKey(
    "raw",
    TEXT_ENCODER.encode(secret),
    {
      name: "HMAC",
      hash: "SHA-256"
    },
    false,
    [
      "sign",
      "verify"
    ]
  );
}
__name(importSigningKey, "importSigningKey");
async function createSignature(value, secret) {
  const key = await importSigningKey(
    secret
  );
  const signature = await crypto.subtle.sign(
    "HMAC",
    key,
    TEXT_ENCODER.encode(value)
  );
  return encodeBase64Url(
    new Uint8Array(signature)
  );
}
__name(createSignature, "createSignature");
async function verifySignature(value, signature, secret) {
  const signatureBytes = decodeBase64Url(signature);
  if (!signatureBytes) {
    return false;
  }
  const key = await importSigningKey(
    secret
  );
  return crypto.subtle.verify(
    "HMAC",
    key,
    signatureBytes,
    TEXT_ENCODER.encode(value)
  );
}
__name(verifySignature, "verifySignature");
function isMagicLinkScope(value) {
  return value === "request:read" || value === "file:read" || value === "shop-requests:read";
}
__name(isMagicLinkScope, "isMagicLinkScope");
function isRecipient(value) {
  return value === "shop" || value === "customer";
}
__name(isRecipient, "isRecipient");
function normalizePayload(value) {
  if (typeof value !== "object" || value === null || Array.isArray(value)) {
    return null;
  }
  const candidate = value;
  if (!isMagicLinkScope(
    candidate.scope
  ) || !isRecipient(
    candidate.recipient
  ) || typeof candidate.shopCode !== "string" || !/^[A-Z0-9]{4}$/.test(
    candidate.shopCode
  ) || typeof candidate.issuedAt !== "number" || !Number.isInteger(
    candidate.issuedAt
  ) || typeof candidate.expiresAt !== "number" || !Number.isInteger(
    candidate.expiresAt
  )) {
    return null;
  }
  if (candidate.scope === "request:read" && (typeof candidate.requestNumber !== "string" || !candidate.requestNumber)) {
    return null;
  }
  if (candidate.scope === "file:read" && (typeof candidate.requestNumber !== "string" || !candidate.requestNumber || typeof candidate.fileId !== "number" || !Number.isInteger(
    candidate.fileId
  ) || candidate.fileId <= 0)) {
    return null;
  }
  return {
    scope: candidate.scope,
    shopCode: candidate.shopCode,
    requestNumber: candidate.requestNumber,
    fileId: candidate.fileId,
    recipient: candidate.recipient,
    issuedAt: candidate.issuedAt,
    expiresAt: candidate.expiresAt
  };
}
__name(normalizePayload, "normalizePayload");
function calculateMagicLinkExpiration(createdAt, retentionDays = 15) {
  const createdDate = new Date(createdAt);
  if (Number.isNaN(
    createdDate.getTime()
  )) {
    throw new Error(
      "Request creation date is invalid."
    );
  }
  return Math.floor(
    (createdDate.getTime() + retentionDays * 24 * 60 * 60 * 1e3) / 1e3
  );
}
__name(calculateMagicLinkExpiration, "calculateMagicLinkExpiration");
async function createMagicLinkToken(env, payload) {
  if (!env.SHOP_LINK_SIGNING_SECRET) {
    throw new Error(
      "SHOP_LINK_SIGNING_SECRET is not configured."
    );
  }
  const encodedPayload = encodeJson(payload);
  const signedValue = `${TOKEN_VERSION}.${encodedPayload}`;
  const signature = await createSignature(
    signedValue,
    env.SHOP_LINK_SIGNING_SECRET
  );
  return [
    TOKEN_VERSION,
    encodedPayload,
    signature
  ].join(".");
}
__name(createMagicLinkToken, "createMagicLinkToken");
async function verifyMagicLinkToken(env, token) {
  if (!env.SHOP_LINK_SIGNING_SECRET) {
    return {
      valid: false,
      error: "Magic-link signing is not configured."
    };
  }
  const parts = token.split(".");
  if (parts.length !== 3) {
    return {
      valid: false,
      error: "The access link is invalid."
    };
  }
  const [
    version,
    encodedPayload,
    signature
  ] = parts;
  if (version !== TOKEN_VERSION) {
    return {
      valid: false,
      error: "The access-link version is not supported."
    };
  }
  const signedValue = `${version}.${encodedPayload}`;
  const validSignature = await verifySignature(
    signedValue,
    signature,
    env.SHOP_LINK_SIGNING_SECRET
  );
  if (!validSignature) {
    return {
      valid: false,
      error: "The access-link signature is invalid."
    };
  }
  const payload = normalizePayload(
    decodeJson(
      encodedPayload
    )
  );
  if (!payload) {
    return {
      valid: false,
      error: "The access-link contents are invalid."
    };
  }
  const currentTime = Math.floor(
    Date.now() / 1e3
  );
  if (payload.expiresAt <= currentTime) {
    return {
      valid: false,
      error: "This access link has expired."
    };
  }
  if (payload.issuedAt > currentTime + 300) {
    return {
      valid: false,
      error: "The access link is not yet valid."
    };
  }
  return {
    valid: true,
    payload
  };
}
__name(verifyMagicLinkToken, "verifyMagicLinkToken");
function createMagicLinkUrl(origin, pathname, token) {
  const url = new URL(
    pathname,
    origin
  );
  url.searchParams.set(
    "token",
    token
  );
  return url.toString();
}
__name(createMagicLinkUrl, "createMagicLinkUrl");

// worker/serviceRequests.ts
var MAX_TOTAL_FILE_SIZE2 = 25 * 1024 * 1024;
var MAX_FILES = 15;
var MAX_METADATA_LENGTH = 1e5;
var FILE_RETENTION_DAYS = 15;
function createJsonResponse9(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse9, "createJsonResponse");
function normalizeShopCode5(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode5, "normalizeShopCode");
function normalizeServiceCode5(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode5, "normalizeServiceCode");
function normalizeKey2(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return /^[a-z0-9_]{1,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeKey2, "normalizeKey");
function normalizeFieldIdentity(field) {
  return `${field.field_key} ${field.label}`.trim().toLowerCase().replace(/[^a-z0-9]+/g, " ");
}
__name(normalizeFieldIdentity, "normalizeFieldIdentity");
function isCustomerNameField(field) {
  const identity = normalizeFieldIdentity(field);
  return field.field_key === "customer_name" || identity.includes("customer name") || identity === "name";
}
__name(isCustomerNameField, "isCustomerNameField");
function isEmailField(field) {
  const identity = normalizeFieldIdentity(
    field
  );
  return field.field_key === "email" || field.field_key === "email_address" || identity.includes(
    "email"
  );
}
__name(isEmailField, "isEmailField");
function isPhoneLikeField(field) {
  const identity = normalizeFieldIdentity(
    field
  );
  return field.field_key === "phone" || field.field_key === "phone_number" || field.field_key === "phone_or_whatsapp" || field.field_key === "whatsapp" || field.field_key === "whatsapp_number" || field.field_key === "mobile" || field.field_key === "mobile_number" || identity.includes(
    "phone"
  ) || identity.includes(
    "whatsapp"
  ) || identity.includes(
    "mobile"
  );
}
__name(isPhoneLikeField, "isPhoneLikeField");
function isContactField(field) {
  return isPhoneLikeField(
    field
  ) || isEmailField(
    field
  );
}
__name(isContactField, "isContactField");
function isRequestDescriptionField(field) {
  if (field.field_type !== "textarea" && field.field_type !== "text") {
    return false;
  }
  const identity = normalizeFieldIdentity(field);
  return field.field_key === "request_details" || field.field_key === "service_details" || field.field_key === "description" || field.field_key === "notes" || identity.includes("what do you need") || identity.includes("describe") || identity.includes("request details") || identity.includes("service details") || identity.includes("help needed");
}
__name(isRequestDescriptionField, "isRequestDescriptionField");
function safelyParseJson3(value) {
  if (!value) {
    return null;
  }
  try {
    return JSON.parse(
      value
    );
  } catch {
    return null;
  }
}
__name(safelyParseJson3, "safelyParseJson");
function normalizeAnswerValue(value) {
  if (typeof value === "string") {
    return value.trim();
  }
  if (typeof value === "boolean") {
    return value;
  }
  if (Array.isArray(value) && value.every(
    (item) => typeof item === "string"
  )) {
    return value.map(
      (item) => item.trim()
    );
  }
  return null;
}
__name(normalizeAnswerValue, "normalizeAnswerValue");
function getStringAnswerByFieldKeys(answers, fieldKeys) {
  const wanted = new Set(
    fieldKeys.map(
      (key) => key.trim().toLowerCase()
    )
  );
  for (const [
    answerKey,
    value
  ] of Object.entries(
    answers
  )) {
    if (typeof value !== "string") {
      continue;
    }
    const fieldKey = answerKey.split(".").at(-1)?.trim().toLowerCase();
    if (fieldKey && wanted.has(fieldKey)) {
      const normalized = value.trim();
      if (normalized) {
        return normalized;
      }
    }
  }
  return null;
}
__name(getStringAnswerByFieldKeys, "getStringAnswerByFieldKeys");
function generateRequestNumber(shopCode, serviceCode) {
  const now = /* @__PURE__ */ new Date();
  const datePart = [
    now.getUTCFullYear(),
    String(
      now.getUTCMonth() + 1
    ).padStart(
      2,
      "0"
    ),
    String(
      now.getUTCDate()
    ).padStart(
      2,
      "0"
    )
  ].join("");
  const randomPart = crypto.randomUUID().replaceAll(
    "-",
    ""
  ).slice(
    0,
    6
  ).toUpperCase();
  return [
    "SR",
    shopCode,
    serviceCode,
    datePart,
    randomPart
  ].join("-");
}
__name(generateRequestNumber, "generateRequestNumber");
function sanitizeFileName2(fileName) {
  const normalized = fileName.trim().replace(
    /[^A-Za-z0-9._-]+/g,
    "_"
  ).replace(
    /^_+|_+$/g,
    ""
  );
  return (normalized || "uploaded-file").slice(
    0,
    180
  );
}
__name(sanitizeFileName2, "sanitizeFileName");
function createStorageKey2(shopCode, requestNumber, sectionKey, fieldKey, file, index) {
  const randomPart = crypto.randomUUID().replaceAll(
    "-",
    ""
  ).slice(
    0,
    10
  );
  return [
    "service-requests",
    shopCode,
    requestNumber,
    sectionKey,
    fieldKey,
    `${String(
      index + 1
    ).padStart(
      2,
      "0"
    )}-${randomPart}-${sanitizeFileName2(
      file.name
    )}`
  ].join("/");
}
__name(createStorageKey2, "createStorageKey");
function getConfiguredOptions(field) {
  const parsed = safelyParseJson3(
    field.options_json
  );
  if (!Array.isArray(parsed)) {
    return [];
  }
  const options = [];
  for (const item of parsed) {
    if (typeof item !== "object" || item === null) {
      continue;
    }
    const candidate = item;
    if (typeof candidate.value !== "string" || typeof candidate.label !== "string") {
      continue;
    }
    options.push({
      value: candidate.value,
      label: candidate.label
    });
  }
  return options;
}
__name(getConfiguredOptions, "getConfiguredOptions");
function getValidationRules(field) {
  const parsed = safelyParseJson3(
    field.validation_json
  );
  if (typeof parsed !== "object" || parsed === null || Array.isArray(parsed)) {
    return {};
  }
  return parsed;
}
__name(getValidationRules, "getValidationRules");
async function loadShop3(env, shopCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          status,
          email_address

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(shopCode).first();
}
__name(loadShop3, "loadShop");
async function loadService3(env, shopCode, serviceCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          s.id,
          s.service_code,
          s.name,
          s.category,
          s.workflow_type,

          CAST(
            s.enabled AS INTEGER
          ) AS global_enabled,

          ss.enabled
            AS shop_enabled

        FROM services s

        LEFT JOIN shop_services ss
          ON ss.service_id =
            s.id

          AND ss.shop_code = ?

        WHERE
          s.service_code = ?

          AND s.service_type =
            'system'

        LIMIT 1
      `
  ).bind(
    shopCode,
    serviceCode
  ).first();
}
__name(loadService3, "loadService");
async function loadFormSchema(env, serviceId) {
  const sectionsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key,
            label,
            visibility,
            include_in_shop_email,
            include_in_customer_email,
            sort_order

          FROM service_sections

          WHERE service_id = ?

          ORDER BY
            sort_order ASC,
            id ASC
        `
  ).bind(serviceId).all();
  if (sectionsResult.results.length === 0) {
    return {
      sections: [],
      fields: []
    };
  }
  const sectionIds = sectionsResult.results.map(
    (section) => section.id
  );
  const placeholders = sectionIds.map(() => "?").join(", ");
  const fieldsResult = await env.gyan_registry.prepare(
    `
          SELECT
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            email_label,
            include_in_shop_email,
            include_in_customer_email,
            options_json,
            validation_json,
            sort_order

          FROM service_fields

          WHERE section_id IN (
            ${placeholders}
          )

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `
  ).bind(
    ...sectionIds
  ).all();
  return {
    sections: sectionsResult.results,
    fields: fieldsResult.results
  };
}
__name(loadFormSchema, "loadFormSchema");
async function loadNotificationFiles(env, serviceRequestId) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            original_file_name,
            file_size

          FROM service_request_files

          WHERE service_request_id = ?

          ORDER BY id ASC
        `
  ).bind(
    serviceRequestId
  ).all();
  return result.results;
}
__name(loadNotificationFiles, "loadNotificationFiles");
function validateChoiceValue(field, value) {
  const configuredOptions = getConfiguredOptions(
    field
  );
  if (configuredOptions.length === 0) {
    return true;
  }
  return configuredOptions.some(
    (option) => option.value === value
  );
}
__name(validateChoiceValue, "validateChoiceValue");
function validateAnswer(field, value) {
  const required = field.requirement === "mandatory";
  if (field.field_type === "checkbox") {
    if (required && value !== true) {
      return `${field.label} is required.`;
    }
    if (value !== void 0 && typeof value !== "boolean") {
      return `${field.label} contains an invalid value.`;
    }
    return null;
  }
  if (field.field_type === "checkbox-group") {
    if (required && (!Array.isArray(
      value
    ) || value.length === 0)) {
      return `${field.label} requires at least one selection.`;
    }
    if (value !== void 0 && !Array.isArray(value)) {
      return `${field.label} contains an invalid value.`;
    }
    if (Array.isArray(value)) {
      for (const selection of value) {
        if (!validateChoiceValue(
          field,
          selection
        )) {
          return `${field.label} contains an invalid selection.`;
        }
      }
    }
    return null;
  }
  if (field.field_type === "file") {
    return null;
  }
  const text = typeof value === "string" ? value.trim() : "";
  if (required && !text) {
    return `${field.label} is required.`;
  }
  if (!text) {
    return null;
  }
  if (field.field_type === "select" || field.field_type === "radio") {
    if (!validateChoiceValue(
      field,
      text
    )) {
      return `${field.label} contains an invalid selection.`;
    }
  }
  const rules = getValidationRules(
    field
  );
  if (typeof rules.minimumLength === "number" && text.length < rules.minimumLength) {
    return `${field.label} must contain at least ${rules.minimumLength} characters.`;
  }
  if (typeof rules.maximumLength === "number" && text.length > rules.maximumLength) {
    return `${field.label} cannot exceed ${rules.maximumLength} characters.`;
  }
  if (field.field_type === "number") {
    const numericValue = Number(text);
    if (!Number.isFinite(
      numericValue
    )) {
      return `${field.label} must be a valid number.`;
    }
    if (typeof rules.minimum === "number" && numericValue < rules.minimum) {
      return `${field.label} must be at least ${rules.minimum}.`;
    }
    if (typeof rules.maximum === "number" && numericValue > rules.maximum) {
      return `${field.label} cannot exceed ${rules.maximum}.`;
    }
  }
  if (typeof rules.pattern === "string" && rules.pattern) {
    try {
      const expression = new RegExp(
        rules.pattern
      );
      if (!expression.test(
        text
      )) {
        return `${field.label} is not in the expected format.`;
      }
    } catch {
    }
  }
  return null;
}
__name(validateAnswer, "validateAnswer");
function formatAnswerValue(field, value) {
  if (value === void 0 || value === null || value === "") {
    return "Not provided";
  }
  if (typeof value === "boolean") {
    return value ? "Yes" : "No";
  }
  const optionLabels = new Map(
    getConfiguredOptions(
      field
    ).map(
      (option) => [
        option.value,
        option.label
      ]
    )
  );
  if (Array.isArray(value)) {
    if (value.length === 0) {
      return "None selected";
    }
    return value.map(
      (item) => optionLabels.get(
        item
      ) ?? item
    ).join(", ");
  }
  return optionLabels.get(
    value
  ) ?? value;
}
__name(formatAnswerValue, "formatAnswerValue");
function createEmailSections(sections, fields, answers, recipient) {
  const sectionMap = new Map(
    sections.map(
      (section) => [
        section.id,
        section
      ]
    )
  );
  const grouped = /* @__PURE__ */ new Map();
  for (const field of fields) {
    const section = sectionMap.get(
      field.section_id
    );
    if (!section || section.visibility !== "visible" || field.requirement === "hidden") {
      continue;
    }
    const sectionIncluded = recipient === "shop" ? Boolean(
      section.include_in_shop_email
    ) : Boolean(
      section.include_in_customer_email
    );
    const fieldIncluded = recipient === "shop" ? Boolean(
      field.include_in_shop_email
    ) : Boolean(
      field.include_in_customer_email
    );
    if (!sectionIncluded || !fieldIncluded) {
      continue;
    }
    if (section.section_key === "customer") {
      continue;
    }
    const answerKey = `${section.section_key}.${field.field_key}`;
    const existing = grouped.get(
      section.id
    ) ?? {
      label: section.label,
      rows: []
    };
    existing.rows.push({
      label: field.email_label?.trim() || field.label,
      value: formatAnswerValue(
        field,
        answers[answerKey]
      )
    });
    grouped.set(
      section.id,
      existing
    );
  }
  return [...sections].sort(
    (first, second) => first.sort_order - second.sort_order
  ).map(
    (section) => grouped.get(
      section.id
    )
  ).filter(
    (section) => Boolean(
      section && section.rows.length > 0
    )
  );
}
__name(createEmailSections, "createEmailSections");
async function createRequestAccessAction(env, origin, requestNumber, shopCode, recipient, expiresAt) {
  const issuedAt = Math.floor(
    Date.now() / 1e3
  );
  const token = await createMagicLinkToken(
    env,
    {
      scope: "request:read",
      shopCode,
      requestNumber,
      recipient,
      issuedAt,
      expiresAt
    }
  );
  return {
    label: recipient === "shop" ? "View request" : "View my request",
    url: createMagicLinkUrl(
      origin,
      `/shared/requests/${encodeURIComponent(
        requestNumber
      )}`,
      token
    ),
    primary: true
  };
}
__name(createRequestAccessAction, "createRequestAccessAction");
async function createShopRequestsAction(env, origin, shopCode, expiresAt) {
  const issuedAt = Math.floor(
    Date.now() / 1e3
  );
  const token = await createMagicLinkToken(
    env,
    {
      scope: "shop-requests:read",
      shopCode,
      recipient: "shop",
      issuedAt,
      expiresAt
    }
  );
  return {
    label: "View active requests",
    url: createMagicLinkUrl(
      origin,
      `/shared/shops/${encodeURIComponent(
        shopCode
      )}/requests`,
      token
    )
  };
}
__name(createShopRequestsAction, "createShopRequestsAction");
async function createFileAccessActions(env, origin, requestNumber, shopCode, recipient, files, expiresAt) {
  const actions = [];
  for (const file of files) {
    const issuedAt = Math.floor(
      Date.now() / 1e3
    );
    const token = await createMagicLinkToken(
      env,
      {
        scope: "file:read",
        shopCode,
        requestNumber,
        fileId: file.id,
        recipient,
        issuedAt,
        expiresAt
      }
    );
    actions.push({
      label: `Download ${file.original_file_name}`,
      url: createMagicLinkUrl(
        origin,
        `/api/shared/files/${file.id}/download`,
        token
      )
    });
  }
  return actions;
}
__name(createFileAccessActions, "createFileAccessActions");
async function createNotificationActions(env, origin, requestNumber, shopCode, createdAt, files) {
  const expiresAt = calculateMagicLinkExpiration(
    createdAt,
    FILE_RETENTION_DAYS
  );
  const [
    shopRequestAction,
    customerRequestAction,
    shopRequestsAction,
    shopFileActions,
    customerFileActions
  ] = await Promise.all([
    createRequestAccessAction(
      env,
      origin,
      requestNumber,
      shopCode,
      "shop",
      expiresAt
    ),
    createRequestAccessAction(
      env,
      origin,
      requestNumber,
      shopCode,
      "customer",
      expiresAt
    ),
    createShopRequestsAction(
      env,
      origin,
      shopCode,
      expiresAt
    ),
    createFileAccessActions(
      env,
      origin,
      requestNumber,
      shopCode,
      "shop",
      files,
      expiresAt
    ),
    createFileAccessActions(
      env,
      origin,
      requestNumber,
      shopCode,
      "customer",
      files,
      expiresAt
    )
  ]);
  return {
    shop: [
      shopRequestAction,
      shopRequestsAction,
      ...shopFileActions
    ],
    customer: [
      customerRequestAction,
      ...customerFileActions
    ]
  };
}
__name(createNotificationActions, "createNotificationActions");
async function deleteStoredFiles2(env, storedFiles) {
  if (storedFiles.length === 0) {
    return;
  }
  try {
    await env.GYAN_PRINT_FILES.delete(
      storedFiles.map(
        (storedFile) => storedFile.storageKey
      )
    );
  } catch (error) {
    console.error(
      "Unable to remove service-request files:",
      error
    );
  }
}
__name(deleteStoredFiles2, "deleteStoredFiles");
async function deleteCreatedRequest(env, requestId) {
  try {
    await env.gyan_registry.prepare(
      `
          DELETE FROM
            service_requests

          WHERE id = ?
        `
    ).bind(
      requestId
    ).run();
  } catch (error) {
    console.error(
      "Unable to remove service request:",
      error
    );
  }
}
__name(deleteCreatedRequest, "deleteCreatedRequest");
async function handleCreateServiceRequest(request, env, shopCode, serviceCode) {
  const requestUrl = new URL(
    request.url
  );
  const publicOrigin = requestUrl.origin;
  const shop = await loadShop3(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse9(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse9(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  const service = await loadService3(
    env,
    shopCode,
    serviceCode
  );
  if (!service) {
    return createJsonResponse9(
      {
        error: "Service not found."
      },
      404
    );
  }
  const effectiveEnabled = service.shop_enabled === null ? Boolean(
    service.global_enabled
  ) : Boolean(
    service.shop_enabled
  );
  if (!effectiveEnabled) {
    return createJsonResponse9(
      {
        error: "This service is not currently available."
      },
      403
    );
  }
  let formData;
  try {
    formData = await request.formData();
  } catch {
    return createJsonResponse9(
      {
        error: "The submitted form data could not be read."
      },
      400
    );
  }
  const metadataValue = formData.get(
    "metadata"
  );
  if (typeof metadataValue !== "string") {
    return createJsonResponse9(
      {
        error: "Request metadata is missing."
      },
      400
    );
  }
  if (metadataValue.length > MAX_METADATA_LENGTH) {
    return createJsonResponse9(
      {
        error: "The submitted request information is too large."
      },
      400
    );
  }
  let metadata;
  try {
    metadata = JSON.parse(
      metadataValue
    );
  } catch {
    return createJsonResponse9(
      {
        error: "Request metadata is invalid."
      },
      400
    );
  }
  if (!Array.isArray(
    metadata.answers
  )) {
    return createJsonResponse9(
      {
        error: "Request answers are missing."
      },
      400
    );
  }
  const {
    sections,
    fields
  } = await loadFormSchema(
    env,
    service.id
  );
  if (sections.length === 0 || fields.length === 0) {
    return createJsonResponse9(
      {
        error: "This service does not have a request form configured."
      },
      409
    );
  }
  const visibleSectionMap = new Map(
    sections.filter(
      (section) => section.visibility === "visible"
    ).map(
      (section) => [
        section.id,
        section.section_key
      ]
    )
  );
  const fieldMap = /* @__PURE__ */ new Map();
  for (const field of fields) {
    const sectionKey = visibleSectionMap.get(
      field.section_id
    );
    if (!sectionKey || field.requirement === "hidden") {
      continue;
    }
    fieldMap.set(
      `${sectionKey}.${field.field_key}`,
      field
    );
  }
  const answers = {};
  for (const rawAnswer of metadata.answers) {
    if (typeof rawAnswer !== "object" || rawAnswer === null) {
      return createJsonResponse9(
        {
          error: "One or more request answers are invalid."
        },
        400
      );
    }
    const submittedAnswer = rawAnswer;
    const sectionKey = normalizeKey2(
      submittedAnswer.sectionKey
    );
    const fieldKey = normalizeKey2(
      submittedAnswer.fieldKey
    );
    const value = normalizeAnswerValue(
      submittedAnswer.value
    );
    if (!sectionKey || !fieldKey || value === null) {
      return createJsonResponse9(
        {
          error: "One or more request answers are invalid."
        },
        400
      );
    }
    const answerKey = `${sectionKey}.${fieldKey}`;
    if (!fieldMap.has(
      answerKey
    )) {
      return createJsonResponse9(
        {
          error: `Unknown form field: ${answerKey}`
        },
        400
      );
    }
    if (Object.hasOwn(
      answers,
      answerKey
    )) {
      return createJsonResponse9(
        {
          error: `The field ${answerKey} was submitted more than once.`
        },
        400
      );
    }
    answers[answerKey] = value;
  }
  const isOnlineRequest = service.workflow_type?.trim().toLowerCase() === "online" || service.workflow_type?.trim().toLowerCase() === "remote" || service.category?.trim().toLowerCase() === "online" || service.category?.trim().toLowerCase() === "digital" || service.category?.trim().toLowerCase() === "nearby";
  const compactEmailEntry = isOnlineRequest ? [...fieldMap.entries()].find(
    ([, field]) => isEmailField(
      field
    )
  ) : void 0;
  const compactEmailValue = compactEmailEntry ? answers[compactEmailEntry[0]] : void 0;
  const compactHasValidEmail = typeof compactEmailValue === "string" && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    compactEmailValue.trim()
  );
  for (const [
    answerKey,
    field
  ] of fieldMap) {
    const validationField = isOnlineRequest ? {
      ...field,
      requirement: isCustomerNameField(
        field
      ) ? "mandatory" : "optional",
      validation_json: compactHasValidEmail && isPhoneLikeField(
        field
      ) ? null : field.validation_json
    } : field;
    const validationError = validateAnswer(
      validationField,
      answers[answerKey]
    );
    if (validationError) {
      return createJsonResponse9(
        {
          error: validationError
        },
        400
      );
    }
  }
  const submittedFiles = [];
  for (const [
    formKey,
    formValue
  ] of formData.entries()) {
    if (!formKey.startsWith(
      "file:"
    ) || !(formValue instanceof File)) {
      continue;
    }
    if (formValue.size === 0) {
      continue;
    }
    const keyParts = formKey.split(":");
    if (keyParts.length !== 3) {
      return createJsonResponse9(
        {
          error: "A submitted file field is invalid."
        },
        400
      );
    }
    const sectionKey = normalizeKey2(
      keyParts[1]
    );
    const fieldKey = normalizeKey2(
      keyParts[2]
    );
    const field = sectionKey && fieldKey ? fieldMap.get(
      `${sectionKey}.${fieldKey}`
    ) : null;
    if (!sectionKey || !fieldKey || !field || field.field_type !== "file") {
      return createJsonResponse9(
        {
          error: "A file was submitted for an invalid field."
        },
        400
      );
    }
    submittedFiles.push({
      sectionKey,
      fieldKey,
      file: formValue
    });
  }
  if (isOnlineRequest) {
    const fieldEntries = [...fieldMap.entries()];
    const nameEntry = fieldEntries.find(
      ([, field]) => isCustomerNameField(
        field
      )
    );
    const descriptionEntry = fieldEntries.find(
      ([, field]) => isRequestDescriptionField(
        field
      )
    );
    const contactEntries = fieldEntries.filter(
      ([, field]) => isContactField(
        field
      )
    );
    const nameValue = nameEntry ? answers[nameEntry[0]] : void 0;
    if (typeof nameValue !== "string" || !nameValue.trim()) {
      return createJsonResponse9(
        {
          error: "Your name is required."
        },
        400
      );
    }
    const descriptionValue = descriptionEntry ? answers[descriptionEntry[0]] : void 0;
    const hasDescription = typeof descriptionValue === "string" && descriptionValue.trim().length > 0;
    const hasAttachment = submittedFiles.length > 0;
    if (!hasDescription && !hasAttachment) {
      return createJsonResponse9(
        {
          error: "Describe what you need or attach at least one file."
        },
        400
      );
    }
    const hasValidEmail = contactEntries.some(
      ([
        answerKey,
        field
      ]) => {
        if (!isEmailField(
          field
        )) {
          return false;
        }
        const value = answers[answerKey];
        return typeof value === "string" && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
          value.trim()
        );
      }
    );
    const hasUsablePhone = contactEntries.some(
      ([
        answerKey,
        field
      ]) => {
        if (!isPhoneLikeField(
          field
        )) {
          return false;
        }
        const value = answers[answerKey];
        if (typeof value !== "string") {
          return false;
        }
        const digits = value.replace(
          /\D/g,
          ""
        );
        return digits.length >= 7;
      }
    );
    if (!hasValidEmail && !hasUsablePhone) {
      return createJsonResponse9(
        {
          error: "Provide a valid phone / WhatsApp number or email address."
        },
        400
      );
    }
  }
  if (submittedFiles.length > MAX_FILES) {
    return createJsonResponse9(
      {
        error: `A request may contain up to ${MAX_FILES} files.`
      },
      400
    );
  }
  for (const [
    answerKey,
    field
  ] of fieldMap) {
    if (field.field_type !== "file" || field.requirement !== "mandatory" || isOnlineRequest) {
      continue;
    }
    const [
      sectionKey,
      fieldKey
    ] = answerKey.split(".");
    const hasFile = submittedFiles.some(
      (item) => item.sectionKey === sectionKey && item.fieldKey === fieldKey
    );
    if (!hasFile) {
      return createJsonResponse9(
        {
          error: `${field.label} is required.`
        },
        400
      );
    }
  }
  const totalFileSize = submittedFiles.reduce(
    (total, item) => total + item.file.size,
    0
  );
  if (totalFileSize > MAX_TOTAL_FILE_SIZE2) {
    return createJsonResponse9(
      {
        error: "The total upload size cannot exceed 25 MB."
      },
      400
    );
  }
  const storageCapacity = await assertUploadCapacity(
    env,
    totalFileSize
  );
  if (!storageCapacity.allowed) {
    return createJsonResponse9(
      {
        error: storageCapacity.error,
        storage: {
          state: "stopped",
          usedBytes: storageCapacity.usedBytes,
          projectedBytes: storageCapacity.projectedBytes,
          stopBytes: storageCapacity.stopBytes
        }
      },
      storageCapacity.status
    );
  }
  const customerName = getStringAnswerByFieldKeys(
    answers,
    [
      "customer_name",
      "name"
    ]
  );
  const phoneOrWhatsApp = getStringAnswerByFieldKeys(
    answers,
    [
      "phone_or_whatsapp"
    ]
  );
  const phoneNumber = getStringAnswerByFieldKeys(
    answers,
    [
      "phone_number",
      "phone",
      "mobile_number",
      "mobile"
    ]
  ) ?? phoneOrWhatsApp;
  const emailAddress = getStringAnswerByFieldKeys(
    answers,
    [
      "email_address",
      "email"
    ]
  );
  const whatsAppNumber = getStringAnswerByFieldKeys(
    answers,
    [
      "whatsapp_number",
      "whatsapp"
    ]
  ) ?? phoneOrWhatsApp;
  const whatsAppConsent = Object.entries(
    answers
  ).some(
    ([
      answerKey,
      value
    ]) => answerKey.split(".").at(-1) === "whatsapp_consent" && value === true
  );
  const requestNumber = generateRequestNumber(
    shopCode,
    serviceCode
  );
  let createdRequest = null;
  const storedFiles = [];
  try {
    createdRequest = await env.gyan_registry.prepare(
      `
            INSERT INTO service_requests (
              request_number,
              shop_code,
              service_id,
              customer_name,
              phone_number,
              email_address,
              whatsapp_number,
              whatsapp_consent,
              status,
              details_json
            )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              'submitted',
              ?
            )

            RETURNING
              id,
              request_number,
              status,
              created_at
          `
    ).bind(
      requestNumber,
      shopCode,
      service.id,
      customerName,
      phoneNumber,
      emailAddress,
      whatsAppNumber,
      whatsAppConsent ? 1 : 0,
      JSON.stringify(
        answers
      )
    ).first();
    if (!createdRequest) {
      throw new Error(
        "The service request could not be created."
      );
    }
    for (let index = 0; index < submittedFiles.length; index += 1) {
      const item = submittedFiles[index];
      const contentType = item.file.type || "application/octet-stream";
      const storageKey = createStorageKey2(
        shopCode,
        requestNumber,
        item.sectionKey,
        item.fieldKey,
        item.file,
        index
      );
      const storedObject = await env.GYAN_PRINT_FILES.put(
        storageKey,
        item.file.stream(),
        {
          httpMetadata: {
            contentType
          },
          customMetadata: {
            requestNumber,
            shopCode,
            serviceCode,
            sectionKey: item.sectionKey,
            fieldKey: item.fieldKey,
            originalFileName: item.file.name
          }
        }
      );
      if (!storedObject) {
        throw new Error(
          `The file ${item.file.name} could not be stored.`
        );
      }
      storedFiles.push({
        ...item,
        storageKey,
        contentType
      });
    }
    if (storedFiles.length > 0) {
      await env.gyan_registry.batch(
        storedFiles.map(
          (storedFile) => env.gyan_registry.prepare(
            `
                    INSERT INTO service_request_files (
                      service_request_id,
                      section_key,
                      field_key,
                      original_file_name,
                      content_type,
                      file_size,
                      storage_key,
                      storage_status
                    )
                    VALUES (
                      ?,
                      ?,
                      ?,
                      ?,
                      ?,
                      ?,
                      ?,
                      'stored'
                    )
                  `
          ).bind(
            createdRequest.id,
            storedFile.sectionKey,
            storedFile.fieldKey,
            storedFile.file.name,
            storedFile.contentType,
            storedFile.file.size,
            storedFile.storageKey
          )
        )
      );
    }
    await addStoredBytes(
      env,
      totalFileSize
    );
  } catch (error) {
    console.error(
      "Service request creation failed:",
      error
    );
    await deleteStoredFiles2(
      env,
      storedFiles
    );
    if (createdRequest) {
      await deleteCreatedRequest(
        env,
        createdRequest.id
      );
    }
    return createJsonResponse9(
      {
        error: "The service request or its files could not be stored."
      },
      500
    );
  }
  const notificationFileRows = await loadNotificationFiles(
    env,
    createdRequest.id
  );
  const notificationFiles = notificationFileRows.map(
    (file) => ({
      name: file.original_file_name,
      size: file.file_size
    })
  );
  const shopEmailSections = createEmailSections(
    sections,
    fields,
    answers,
    "shop"
  );
  const customerEmailSections = createEmailSections(
    sections,
    fields,
    answers,
    "customer"
  );
  let notificationActions = {
    shop: [],
    customer: []
  };
  try {
    notificationActions = await createNotificationActions(
      env,
      publicOrigin,
      createdRequest.request_number,
      shop.code,
      createdRequest.created_at,
      notificationFileRows
    );
  } catch (error) {
    console.error(
      "Magic-link creation failed:",
      error
    );
  }
  let notificationResults = [];
  try {
    notificationResults = await sendServiceRequestNotifications(
      env,
      {
        shop: {
          code: shop.code,
          name: shop.name,
          email: shop.email_address
        },
        service: {
          code: service.service_code,
          name: service.name
        },
        request: {
          requestNumber: createdRequest.request_number,
          status: createdRequest.status,
          createdAt: createdRequest.created_at
        },
        customer: {
          name: customerName,
          phone: phoneNumber,
          whatsApp: whatsAppNumber,
          email: emailAddress
        },
        files: notificationFiles,
        sections: {
          shop: shopEmailSections,
          customer: customerEmailSections
        },
        shopActions: notificationActions.shop,
        customerActions: notificationActions.customer,
        adminActions: [
          {
            label: "All Requests",
            url: `${publicOrigin}/admin`
          },
          {
            label: "All Shops",
            url: `${publicOrigin}/admin/shops`
          },
          {
            label: "Manage Services",
            url: `${publicOrigin}/admin/services`
          }
        ],
        retentionDays: FILE_RETENTION_DAYS
      }
    );
  } catch (error) {
    console.error(
      "Service request notifications failed:",
      error
    );
  }
  return createJsonResponse9(
    {
      request: {
        requestNumber: createdRequest.request_number,
        status: createdRequest.status,
        createdAt: createdRequest.created_at,
        serviceCode: service.service_code,
        serviceName: service.name,
        fileCount: storedFiles.length
      },
      notifications: notificationResults,
      storage: {
        state: storageCapacity.warningActive ? "warning" : "normal",
        warningActive: storageCapacity.warningActive,
        projectedBytes: storageCapacity.projectedBytes,
        stopBytes: storageCapacity.stopBytes
      }
    },
    201
  );
}
__name(handleCreateServiceRequest, "handleCreateServiceRequest");
async function handleServiceRequestsRoute(request, env, url) {
  const match = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/services\/([A-Za-z0-9_]{2,50})\/requests$/
  );
  if (!match) {
    return null;
  }
  if (request.method !== "POST") {
    return createJsonResponse9(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const shopCode = normalizeShopCode5(
    match[1]
  );
  const serviceCode = normalizeServiceCode5(
    match[2]
  );
  if (!shopCode || !serviceCode) {
    return createJsonResponse9(
      {
        error: "Invalid shop or service code."
      },
      400
    );
  }
  return handleCreateServiceRequest(
    request,
    env,
    shopCode,
    serviceCode
  );
}
__name(handleServiceRequestsRoute, "handleServiceRequestsRoute");

// worker/sharedRequests.ts
init_modules_watch_stub();
var FILE_RETENTION_DAYS2 = 15;
function createJsonResponse10(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse10, "createJsonResponse");
function normalizeRequestNumber(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_-]{8,120}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeRequestNumber, "normalizeRequestNumber");
function normalizeShopCode6(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode6, "normalizeShopCode");
function normalizeFileId(value) {
  if (!/^\d+$/.test(value)) {
    return null;
  }
  const id = Number(value);
  return Number.isSafeInteger(id) && id > 0 ? id : null;
}
__name(normalizeFileId, "normalizeFileId");
function safelyParseJson4(value) {
  try {
    const parsed = JSON.parse(value);
    if (typeof parsed === "object" && parsed !== null && !Array.isArray(parsed)) {
      return parsed;
    }
  } catch {
  }
  return {};
}
__name(safelyParseJson4, "safelyParseJson");
function calculateExpirationDate2(createdAt) {
  const createdDate = new Date(createdAt);
  if (Number.isNaN(
    createdDate.getTime()
  )) {
    return null;
  }
  return new Date(
    createdDate.getTime() + FILE_RETENTION_DAYS2 * 24 * 60 * 60 * 1e3
  );
}
__name(calculateExpirationDate2, "calculateExpirationDate");
function requestHasExpired(createdAt) {
  const expirationDate = calculateExpirationDate2(
    createdAt
  );
  if (!expirationDate) {
    return true;
  }
  return expirationDate.getTime() <= Date.now();
}
__name(requestHasExpired, "requestHasExpired");
function readToken(url) {
  const token = url.searchParams.get("token")?.trim();
  return token || null;
}
__name(readToken, "readToken");
async function requireMagicLink(env, url) {
  const token = readToken(url);
  if (!token) {
    return {
      response: createJsonResponse10(
        {
          error: "The secure access token is missing."
        },
        401
      )
    };
  }
  const verified = await verifyMagicLinkToken(
    env,
    token
  );
  if (!verified.valid || !verified.payload) {
    return {
      response: createJsonResponse10(
        {
          error: verified.error ?? "The secure access link is invalid."
        },
        401
      )
    };
  }
  return {
    payload: verified.payload
  };
}
__name(requireMagicLink, "requireMagicLink");
async function loadRequest(env, requestNumber) {
  return env.gyan_registry.prepare(
    `
        SELECT
          sr.id,
          sr.request_number,

          sr.shop_code,
          sh.name AS shop_name,

          s.service_code,
          s.name AS service_name,

          sr.customer_name,
          sr.phone_number,
          sr.email_address,
          sr.whatsapp_number,

          sr.status,
          sr.details_json,

          sr.estimated_amount_paise,

          sr.created_at,
          sr.updated_at

        FROM service_requests sr

        INNER JOIN shops sh
          ON sh.code =
            sr.shop_code

        INNER JOIN services s
          ON s.id =
            sr.service_id

        WHERE
          sr.request_number = ?

        LIMIT 1
      `
  ).bind(
    requestNumber
  ).first();
}
__name(loadRequest, "loadRequest");
async function loadRequestFiles(env, requestId) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            service_request_id,

            section_key,
            field_key,

            original_file_name,
            content_type,
            file_size,

            storage_key,
            storage_status,

            created_at

          FROM service_request_files

          WHERE
            service_request_id = ?

          ORDER BY
            id ASC
        `
  ).bind(
    requestId
  ).all();
  return result.results;
}
__name(loadRequestFiles, "loadRequestFiles");
function verifyRequestAccess(payload, requestRow) {
  if (payload.scope !== "request:read") {
    return createJsonResponse10(
      {
        error: "This access link cannot view a request."
      },
      403
    );
  }
  if (payload.shopCode !== requestRow.shop_code) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another shop."
      },
      403
    );
  }
  if (payload.requestNumber !== requestRow.request_number) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another request."
      },
      403
    );
  }
  return null;
}
__name(verifyRequestAccess, "verifyRequestAccess");
async function createSharedFileDownloadUrl(env, origin, requestRow, file, recipient, expiresAt) {
  const token = await createMagicLinkToken(
    env,
    {
      scope: "file:read",
      shopCode: requestRow.shop_code,
      requestNumber: requestRow.request_number,
      fileId: file.id,
      recipient,
      issuedAt: Math.floor(
        Date.now() / 1e3
      ),
      expiresAt
    }
  );
  return createMagicLinkUrl(
    origin,
    `/api/shared/files/${file.id}/download`,
    token
  );
}
__name(createSharedFileDownloadUrl, "createSharedFileDownloadUrl");
async function handleGetSharedRequest(env, url, requestNumber) {
  const authentication = await requireMagicLink(
    env,
    url
  );
  if ("response" in authentication) {
    return authentication.response;
  }
  const requestRow = await loadRequest(
    env,
    requestNumber
  );
  if (!requestRow) {
    return createJsonResponse10(
      {
        error: "Request not found."
      },
      404
    );
  }
  const accessError = verifyRequestAccess(
    authentication.payload,
    requestRow
  );
  if (accessError) {
    return accessError;
  }
  const expirationDate = calculateExpirationDate2(
    requestRow.created_at
  );
  const files = await loadRequestFiles(
    env,
    requestRow.id
  );
  const filesExpired = requestHasExpired(
    requestRow.created_at
  );
  const expiresAtSeconds = authentication.payload.expiresAt;
  const filesWithDownloadUrls = await Promise.all(
    files.map(
      async (file) => {
        const available = !filesExpired && file.storage_status === "stored";
        let downloadUrl = null;
        if (available) {
          try {
            downloadUrl = await createSharedFileDownloadUrl(
              env,
              url.origin,
              requestRow,
              file,
              authentication.payload.recipient,
              expiresAtSeconds
            );
          } catch (error) {
            console.error(
              "Unable to create shared file link:",
              error
            );
          }
        }
        return {
          id: file.id,
          sectionKey: file.section_key,
          fieldKey: file.field_key,
          name: file.original_file_name,
          contentType: file.content_type,
          size: file.file_size,
          status: filesExpired ? "expired" : file.storage_status,
          available,
          downloadUrl
        };
      }
    )
  );
  return createJsonResponse10({
    access: {
      recipient: authentication.payload.recipient,
      readOnly: true
    },
    request: {
      requestNumber: requestRow.request_number,
      status: requestRow.status,
      createdAt: requestRow.created_at,
      updatedAt: requestRow.updated_at,
      estimatedAmountPaise: requestRow.estimated_amount_paise,
      shop: {
        code: requestRow.shop_code,
        name: requestRow.shop_name
      },
      service: {
        code: requestRow.service_code,
        name: requestRow.service_name
      },
      customer: {
        name: requestRow.customer_name,
        phone: requestRow.phone_number,
        email: requestRow.email_address,
        whatsApp: requestRow.whatsapp_number
      },
      answers: safelyParseJson4(
        requestRow.details_json
      ),
      retention: {
        days: FILE_RETENTION_DAYS2,
        expiresAt: expirationDate?.toISOString() ?? null,
        filesExpired
      },
      files: filesWithDownloadUrls
    }
  });
}
__name(handleGetSharedRequest, "handleGetSharedRequest");
async function handleDownloadSharedFile(env, url, fileId) {
  const authentication = await requireMagicLink(
    env,
    url
  );
  if ("response" in authentication) {
    return authentication.response;
  }
  const payload = authentication.payload;
  if (payload.scope !== "file:read") {
    return createJsonResponse10(
      {
        error: "This access link cannot download files."
      },
      403
    );
  }
  if (payload.fileId !== fileId) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another file."
      },
      403
    );
  }
  const fileRow = await env.gyan_registry.prepare(
    `
          SELECT
            srf.id,
            srf.service_request_id,

            srf.section_key,
            srf.field_key,

            srf.original_file_name,
            srf.content_type,
            srf.file_size,

            srf.storage_key,
            srf.storage_status,

            srf.created_at

          FROM service_request_files srf

          WHERE srf.id = ?

          LIMIT 1
        `
  ).bind(
    fileId
  ).first();
  if (!fileRow) {
    return createJsonResponse10(
      {
        error: "File not found."
      },
      404
    );
  }
  const requestRow = await env.gyan_registry.prepare(
    `
          SELECT
            sr.id,
            sr.request_number,

            sr.shop_code,
            sh.name AS shop_name,

            s.service_code,
            s.name AS service_name,

            sr.customer_name,
            sr.phone_number,
            sr.email_address,
            sr.whatsapp_number,

            sr.status,
            sr.details_json,

            sr.estimated_amount_paise,

            sr.created_at,
            sr.updated_at

          FROM service_requests sr

          INNER JOIN shops sh
            ON sh.code =
              sr.shop_code

          INNER JOIN services s
            ON s.id =
              sr.service_id

          WHERE sr.id = ?

          LIMIT 1
        `
  ).bind(
    fileRow.service_request_id
  ).first();
  if (!requestRow) {
    return createJsonResponse10(
      {
        error: "The file request no longer exists."
      },
      404
    );
  }
  if (payload.shopCode !== requestRow.shop_code || payload.requestNumber !== requestRow.request_number) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another request."
      },
      403
    );
  }
  if (requestHasExpired(
    requestRow.created_at
  )) {
    return createJsonResponse10(
      {
        error: "This file has expired and is no longer available."
      },
      410
    );
  }
  if (fileRow.storage_status !== "stored") {
    return createJsonResponse10(
      {
        error: "This file is no longer available."
      },
      410
    );
  }
  const object = await env.GYAN_PRINT_FILES.get(
    fileRow.storage_key
  );
  if (!object) {
    return createJsonResponse10(
      {
        error: "This file has expired or could not be found."
      },
      410
    );
  }
  const headers = new Headers();
  object.writeHttpMetadata(
    headers
  );
  headers.set(
    "content-type",
    fileRow.content_type || "application/octet-stream"
  );
  headers.set(
    "content-length",
    String(
      fileRow.file_size
    )
  );
  headers.set(
    "content-disposition",
    `attachment; filename*=UTF-8''${encodeURIComponent(
      fileRow.original_file_name
    )}`
  );
  headers.set(
    "cache-control",
    "private, no-store"
  );
  headers.set(
    "x-content-type-options",
    "nosniff"
  );
  return new Response(
    object.body,
    {
      status: 200,
      headers
    }
  );
}
__name(handleDownloadSharedFile, "handleDownloadSharedFile");
async function handleGetShopRequests(env, url, shopCode) {
  const authentication = await requireMagicLink(
    env,
    url
  );
  if ("response" in authentication) {
    return authentication.response;
  }
  const payload = authentication.payload;
  if (payload.scope !== "shop-requests:read") {
    return createJsonResponse10(
      {
        error: "This access link cannot view the shop request list."
      },
      403
    );
  }
  if (payload.recipient !== "shop") {
    return createJsonResponse10(
      {
        error: "Only the shop owner may use this access link."
      },
      403
    );
  }
  if (payload.shopCode !== shopCode) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another shop."
      },
      403
    );
  }
  const shop = await env.gyan_registry.prepare(
    `
          SELECT
            code,
            name

          FROM shops

          WHERE code = ?

          LIMIT 1
        `
  ).bind(
    shopCode
  ).first();
  if (!shop) {
    return createJsonResponse10(
      {
        error: "Shop not found."
      },
      404
    );
  }
  const retentionBoundary = new Date(
    Date.now() - FILE_RETENTION_DAYS2 * 24 * 60 * 60 * 1e3
  ).toISOString();
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            sr.request_number,

            s.service_code,
            s.name AS service_name,

            sr.customer_name,

            sr.status,

            COUNT(
              srf.id
            ) AS file_count,

            sr.created_at,
            sr.updated_at

          FROM service_requests sr

          INNER JOIN services s
            ON s.id =
              sr.service_id

          LEFT JOIN service_request_files srf
            ON srf.service_request_id =
              sr.id

          WHERE
            sr.shop_code = ?

            AND sr.created_at >= ?

          GROUP BY
            sr.id,
            sr.request_number,
            s.service_code,
            s.name,
            sr.customer_name,
            sr.status,
            sr.created_at,
            sr.updated_at

          ORDER BY
            sr.created_at DESC

          LIMIT 200
        `
  ).bind(
    shopCode,
    retentionBoundary
  ).all();
  return createJsonResponse10({
    shop: {
      code: shop.code,
      name: shop.name
    },
    retentionDays: FILE_RETENTION_DAYS2,
    requests: result.results.map(
      (requestRow) => ({
        requestNumber: requestRow.request_number,
        service: {
          code: requestRow.service_code,
          name: requestRow.service_name
        },
        customerName: requestRow.customer_name,
        status: requestRow.status,
        fileCount: Number(
          requestRow.file_count
        ),
        createdAt: requestRow.created_at,
        updatedAt: requestRow.updated_at
      })
    )
  });
}
__name(handleGetShopRequests, "handleGetShopRequests");
async function handleSharedRequestsRoute(request, env, url) {
  const requestMatch = url.pathname.match(
    /^\/api\/shared\/requests\/([A-Za-z0-9_-]{8,120})$/
  );
  if (requestMatch) {
    if (request.method !== "GET") {
      return createJsonResponse10(
        {
          error: "Method not allowed."
        },
        405
      );
    }
    const requestNumber = normalizeRequestNumber(
      requestMatch[1]
    );
    if (!requestNumber) {
      return createJsonResponse10(
        {
          error: "Invalid request number."
        },
        400
      );
    }
    return handleGetSharedRequest(
      env,
      url,
      requestNumber
    );
  }
  const fileMatch = url.pathname.match(
    /^\/api\/shared\/files\/(\d+)\/download$/
  );
  if (fileMatch) {
    if (request.method !== "GET") {
      return createJsonResponse10(
        {
          error: "Method not allowed."
        },
        405
      );
    }
    const fileId = normalizeFileId(
      fileMatch[1]
    );
    if (!fileId) {
      return createJsonResponse10(
        {
          error: "Invalid file identifier."
        },
        400
      );
    }
    return handleDownloadSharedFile(
      env,
      url,
      fileId
    );
  }
  const shopMatch = url.pathname.match(
    /^\/api\/shared\/shops\/([A-Za-z0-9]{4})\/requests$/
  );
  if (shopMatch) {
    if (request.method !== "GET") {
      return createJsonResponse10(
        {
          error: "Method not allowed."
        },
        405
      );
    }
    const shopCode = normalizeShopCode6(
      shopMatch[1]
    );
    if (!shopCode) {
      return createJsonResponse10(
        {
          error: "Invalid shop code."
        },
        400
      );
    }
    return handleGetShopRequests(
      env,
      url,
      shopCode
    );
  }
  return null;
}
__name(handleSharedRequestsRoute, "handleSharedRequestsRoute");

// worker/nearbyShops.ts
init_modules_watch_stub();
var SERVICE_SEARCH_TERMS = {
  NEARBY_PRINT: ["print", "printing", "photocopy", "scan"],
  NEARBY_GROCERY: ["grocery", "vegetable", "daily needs"],
  NEARBY_MEDICAL: ["medical", "medicine", "pharmacy", "clinic"],
  NEARBY_TUITION: ["tuition", "tutor", "coaching", "education"],
  NEARBY_FOOD: ["food", "restaurant", "tiffin", "snack"],
  NEARBY_BANKING: ["banking", "payment", "insurance", "financial"],
  NEARBY_COURIER: ["courier", "parcel", "postal", "delivery"],
  NEARBY_COMPUTER: ["computer", "internet", "accessories", "technology"],
  NEARBY_REPAIR: ["repair", "mobile", "appliance", "computer repair"]
};
var GEOAPIFY_CATEGORIES = {
  NEARBY_PRINT: ["commercial", "service"],
  NEARBY_GROCERY: ["commercial.food_and_drink", "commercial.supermarket", "commercial.marketplace"],
  NEARBY_MEDICAL: ["healthcare", "healthcare.pharmacy"],
  NEARBY_TUITION: ["education", "office.educational_institution"],
  NEARBY_FOOD: ["catering", "commercial.food_and_drink"],
  NEARBY_BANKING: ["service.financial", "service.financial.bank", "office.insurance"],
  NEARBY_COURIER: ["service.post", "office.logistics"],
  NEARBY_COMPUTER: ["commercial.elektronics", "office.it"],
  NEARBY_REPAIR: ["service.vehicle.repair", "service"],
  NEARBY_MAPS: ["commercial", "service", "office"]
};
function jsonResponse(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "content-type": "application/json; charset=utf-8",
      "cache-control": "no-store"
    }
  });
}
__name(jsonResponse, "jsonResponse");
function getOptionalNumber(rawValue) {
  if (!rawValue) return null;
  const value = Number(rawValue);
  return Number.isFinite(value) ? value : null;
}
__name(getOptionalNumber, "getOptionalNumber");
function calculateDistanceKm(firstLatitude, firstLongitude, secondLatitude, secondLongitude) {
  const earthRadiusKm = 6371;
  const toRadians3 = /* @__PURE__ */ __name((value) => value * Math.PI / 180, "toRadians");
  const latitudeDifference = toRadians3(secondLatitude - firstLatitude);
  const longitudeDifference = toRadians3(secondLongitude - firstLongitude);
  const firstLatitudeRadians = toRadians3(firstLatitude);
  const secondLatitudeRadians = toRadians3(secondLatitude);
  const haversine = Math.sin(latitudeDifference / 2) ** 2 + Math.cos(firstLatitudeRadians) * Math.cos(secondLatitudeRadians) * Math.sin(longitudeDifference / 2) ** 2;
  return 2 * earthRadiusKm * Math.asin(Math.sqrt(haversine));
}
__name(calculateDistanceKm, "calculateDistanceKm");
function normalizeText(value) {
  return value?.trim().toLowerCase() ?? "";
}
__name(normalizeText, "normalizeText");
async function geocodeLocation(apiKey, city, state) {
  const searchText = [city, state].filter(Boolean).join(", ");
  if (!searchText) return null;
  const parameters = new URLSearchParams({
    text: searchText,
    format: "json",
    limit: "1",
    apiKey
  });
  const response = await fetch(
    `https://api.geoapify.com/v1/geocode/search?${parameters.toString()}`
  );
  if (!response.ok) return null;
  const result = await response.json();
  const first = result.results?.[0];
  if (typeof first?.lat !== "number" || typeof first?.lon !== "number") {
    return null;
  }
  return { latitude: first.lat, longitude: first.lon };
}
__name(geocodeLocation, "geocodeLocation");
async function loadGeoapifyPlaces(apiKey, serviceCode, latitude, longitude) {
  const categories = GEOAPIFY_CATEGORIES[serviceCode] ?? ["commercial", "service"];
  const parameters = new URLSearchParams({
    categories: categories.join(","),
    filter: `circle:${longitude},${latitude},10000`,
    bias: `proximity:${longitude},${latitude}`,
    limit: "10",
    conditions: "named",
    lang: "en",
    apiKey
  });
  const response = await fetch(
    `https://api.geoapify.com/v2/places?${parameters.toString()}`
  );
  if (!response.ok) return [];
  const result = await response.json();
  return (result.features ?? []).map((feature, index) => {
    const properties = feature.properties;
    const name = properties?.name?.trim();
    if (!name) return null;
    const placeLatitude = typeof properties.lat === "number" ? properties.lat : null;
    const placeLongitude = typeof properties.lon === "number" ? properties.lon : null;
    const distanceKm2 = typeof properties.distance === "number" ? properties.distance / 1e3 : placeLatitude != null && placeLongitude != null ? calculateDistanceKm(latitude, longitude, placeLatitude, placeLongitude) : null;
    return {
      id: properties.place_id ?? `geoapify-${index}`,
      name,
      address: properties.formatted ?? [
        properties.address_line1,
        properties.address_line2,
        properties.city,
        properties.state,
        properties.postcode
      ].filter(Boolean).join(", "),
      latitude: placeLatitude,
      longitude: placeLongitude,
      distanceKm: distanceKm2,
      phoneNumber: properties.contact?.phone ?? null,
      website: properties.website ?? null,
      categories: properties.categories ?? []
    };
  }).filter((place) => place !== null);
}
__name(loadGeoapifyPlaces, "loadGeoapifyPlaces");
async function handleNearbyShopsRoute(request, env, url) {
  if (request.method !== "GET" || url.pathname !== "/api/nearby-shops") {
    return null;
  }
  const serviceCode = url.searchParams.get("serviceCode")?.trim().toUpperCase() ?? "";
  let latitude = getOptionalNumber(url.searchParams.get("lat"));
  let longitude = getOptionalNumber(url.searchParams.get("lng"));
  const requestedCity = normalizeText(url.searchParams.get("city"));
  const requestedState = normalizeText(url.searchParams.get("state"));
  const terms = SERVICE_SEARCH_TERMS[serviceCode] ?? [];
  const result = await env.gyan_registry.prepare(`
      SELECT
        sh.code,
        sh.name,
        sh.address_line,
        sh.city,
        sh.state,
        sh.postal_code,
        sh.phone_number,
        sh.whatsapp_number,
        sh.latitude,
        sh.longitude,
        COUNT(CASE WHEN ss.enabled = 1 THEN 1 END) AS matching_service_count,
        GROUP_CONCAT(
          CASE WHEN ss.enabled = 1 THEN COALESCE(ss.display_name, s.name) END,
          '||'
        ) AS service_names
      FROM shops sh
      LEFT JOIN shop_services ss ON ss.shop_code = sh.code
      LEFT JOIN services s ON s.id = ss.service_id
      WHERE sh.status = 'active'
      GROUP BY
        sh.code, sh.name, sh.address_line, sh.city, sh.state, sh.postal_code,
        sh.phone_number, sh.whatsapp_number, sh.latitude, sh.longitude
    `).all();
  const shops = result.results.map((row) => {
    const serviceNames = row.service_names?.split("||").map((name) => name.trim()).filter(Boolean) ?? [];
    const matchingServiceCount = terms.length === 0 ? Number(row.matching_service_count) : serviceNames.filter((serviceName) => {
      const normalizedName = serviceName.toLowerCase();
      return terms.some((term) => normalizedName.includes(term));
    }).length;
    const distanceKm2 = latitude != null && longitude != null && row.latitude != null && row.longitude != null ? calculateDistanceKm(
      latitude,
      longitude,
      Number(row.latitude),
      Number(row.longitude)
    ) : null;
    return {
      code: row.code,
      name: row.name,
      address: [row.address_line, row.city, row.state, row.postal_code].filter(Boolean).join(", "),
      phoneNumber: row.phone_number,
      whatsappNumber: row.whatsapp_number,
      latitude: row.latitude == null ? null : Number(row.latitude),
      longitude: row.longitude == null ? null : Number(row.longitude),
      distanceKm: distanceKm2,
      matchingServiceCount,
      serviceNames
    };
  });
  shops.sort((first, second) => {
    const firstCityMatch = requestedCity && normalizeText(first.address).includes(requestedCity) ? 1 : 0;
    const secondCityMatch = requestedCity && normalizeText(second.address).includes(requestedCity) ? 1 : 0;
    if (first.matchingServiceCount !== second.matchingServiceCount) {
      return second.matchingServiceCount - first.matchingServiceCount;
    }
    if (firstCityMatch !== secondCityMatch) {
      return secondCityMatch - firstCityMatch;
    }
    if (first.distanceKm != null && second.distanceKm != null) {
      return first.distanceKm - second.distanceKm;
    }
    return first.name.localeCompare(second.name);
  });
  let externalPlaces = [];
  const geoapifyApiKey = env.GEOAPIFY_API_KEY?.trim();
  if (geoapifyApiKey && (latitude == null || longitude == null)) {
    const geocoded = await geocodeLocation(
      geoapifyApiKey,
      requestedCity,
      requestedState
    );
    if (geocoded) {
      latitude = geocoded.latitude;
      longitude = geocoded.longitude;
    }
  }
  if (geoapifyApiKey && latitude != null && longitude != null) {
    externalPlaces = await loadGeoapifyPlaces(
      geoapifyApiKey,
      serviceCode,
      latitude,
      longitude
    );
  }
  return jsonResponse({
    serviceCode,
    location: {
      latitude,
      longitude,
      city: requestedCity || null,
      state: requestedState || null
    },
    registeredShops: shops.filter((shop) => shop.matchingServiceCount > 0 || terms.length === 0).slice(0, 20),
    externalPlaces,
    externalSearchAvailable: Boolean(geoapifyApiKey),
    attribution: externalPlaces.length > 0 ? "Places data \xA9 OpenStreetMap contributors, served by Geoapify" : null
  });
}
__name(handleNearbyShopsRoute, "handleNearbyShopsRoute");

// worker/locationHint.ts
init_modules_watch_stub();
function jsonResponse2(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "private, max-age=900"
      }
    }
  );
}
__name(jsonResponse2, "jsonResponse");
function getOptionalString(value) {
  return typeof value === "string" ? value : void 0;
}
__name(getOptionalString, "getOptionalString");
function getCountryDetails(countryCode) {
  const normalizedCode = countryCode?.trim().toUpperCase() ?? "";
  if (normalizedCode === "IN") {
    return {
      code: "IN",
      name: "India",
      currencyCode: "INR",
      currencySymbol: "\u20B9"
    };
  }
  if (normalizedCode === "US") {
    return {
      code: "US",
      name: "United States",
      currencyCode: "USD",
      currencySymbol: "$"
    };
  }
  return {
    code: "OTHER",
    name: "Other",
    currencyCode: null,
    currencySymbol: null
  };
}
__name(getCountryDetails, "getCountryDetails");
function inferCountryCode(cloudflareCountry, browserTimezone, browserLanguages) {
  const cfCountry = cloudflareCountry?.trim().toUpperCase();
  if (cfCountry === "IN" || cfCountry === "US") {
    return cfCountry;
  }
  const timezone = browserTimezone?.trim().toLowerCase() ?? "";
  if (timezone === "asia/kolkata" || timezone === "asia/calcutta") {
    return "IN";
  }
  if (timezone.startsWith(
    "america/"
  )) {
    return "US";
  }
  const languages = browserLanguages?.toLowerCase() ?? "";
  if (languages.includes(
    "en-in"
  ) || languages.includes(
    "hi-in"
  )) {
    return "IN";
  }
  if (languages.includes(
    "en-us"
  )) {
    return "US";
  }
  return "OTHER";
}
__name(inferCountryCode, "inferCountryCode");
function handleLocationHintRoute(request, url) {
  if (request.method !== "GET" || url.pathname !== "/api/location-hint") {
    return null;
  }
  const cf = request.cf;
  const browserTimezone = request.headers.get(
    "x-gyan-timezone"
  );
  const browserLanguages = request.headers.get(
    "x-gyan-languages"
  );
  const cfCountry = getOptionalString(
    cf?.country
  );
  const cfRegion = getOptionalString(
    cf?.region
  );
  const cfRegionCode = getOptionalString(
    cf?.regionCode
  );
  const cfCity = getOptionalString(
    cf?.city
  );
  const cfPostalCode = getOptionalString(
    cf?.postalCode
  );
  const cfTimezone = getOptionalString(
    cf?.timezone
  );
  const inferredCountryCode = inferCountryCode(
    cfCountry,
    browserTimezone,
    browserLanguages
  );
  const country = getCountryDetails(
    inferredCountryCode
  );
  return jsonResponse2({
    countryCode: country.code,
    country: country.name,
    currencyCode: country.currencyCode,
    currencySymbol: country.currencySymbol,
    region: cfRegion ?? "",
    regionCode: cfRegionCode ?? "",
    city: cfCity ?? "",
    postalCode: cfPostalCode ?? "",
    timezone: cfTimezone ?? browserTimezone ?? "",
    source: cfCountry ? "ip" : "browser",
    approximate: true
  });
}
__name(handleLocationHintRoute, "handleLocationHintRoute");

// worker/locationResolve.ts
init_modules_watch_stub();
function jsonResponse3(data, status = 200) {
  return new Response(
    JSON.stringify(
      data
    ),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse3, "jsonResponse");
function getPhoneCountryCode(countryCode) {
  const map = {
    US: "+1",
    CA: "+1",
    IN: "+91",
    GB: "+44",
    IE: "+353",
    AU: "+61",
    NZ: "+64",
    FR: "+33",
    DE: "+49",
    IT: "+39",
    ES: "+34",
    PT: "+351",
    NL: "+31",
    BE: "+32",
    CH: "+41",
    AT: "+43",
    SE: "+46",
    NO: "+47",
    DK: "+45",
    FI: "+358",
    PL: "+48",
    CZ: "+420",
    GR: "+30",
    RO: "+40",
    HU: "+36",
    AE: "+971",
    SA: "+966",
    QA: "+974",
    KW: "+965",
    OM: "+968",
    BH: "+973",
    SG: "+65",
    MY: "+60",
    ID: "+62",
    PH: "+63",
    TH: "+66",
    VN: "+84",
    JP: "+81",
    KR: "+82",
    CN: "+86",
    HK: "+852",
    TW: "+886",
    PK: "+92",
    BD: "+880",
    LK: "+94",
    NP: "+977",
    ZA: "+27",
    NG: "+234",
    KE: "+254",
    EG: "+20",
    MX: "+52",
    BR: "+55",
    AR: "+54",
    CL: "+56",
    CO: "+57",
    PE: "+51"
  };
  return map[countryCode.trim().toUpperCase()] ?? "";
}
__name(getPhoneCountryCode, "getPhoneCountryCode");
function getRegionCode(region, countryCode) {
  const normalizedRegion = region.trim().toLowerCase();
  const normalizedCountry = countryCode.trim().toUpperCase();
  const usStates = {
    alabama: "AL",
    alaska: "AK",
    arizona: "AZ",
    arkansas: "AR",
    california: "CA",
    colorado: "CO",
    connecticut: "CT",
    delaware: "DE",
    florida: "FL",
    georgia: "GA",
    hawaii: "HI",
    idaho: "ID",
    illinois: "IL",
    indiana: "IN",
    iowa: "IA",
    kansas: "KS",
    kentucky: "KY",
    louisiana: "LA",
    maine: "ME",
    maryland: "MD",
    massachusetts: "MA",
    michigan: "MI",
    minnesota: "MN",
    mississippi: "MS",
    missouri: "MO",
    montana: "MT",
    nebraska: "NE",
    nevada: "NV",
    "new hampshire": "NH",
    "new jersey": "NJ",
    "new mexico": "NM",
    "new york": "NY",
    "north carolina": "NC",
    "north dakota": "ND",
    ohio: "OH",
    oklahoma: "OK",
    oregon: "OR",
    pennsylvania: "PA",
    "rhode island": "RI",
    "south carolina": "SC",
    "south dakota": "SD",
    tennessee: "TN",
    texas: "TX",
    utah: "UT",
    vermont: "VT",
    virginia: "VA",
    washington: "WA",
    "west virginia": "WV",
    wisconsin: "WI",
    wyoming: "WY",
    "district of columbia": "DC"
  };
  const indiaStates = {
    "andhra pradesh": "AP",
    "arunachal pradesh": "AR",
    assam: "AS",
    bihar: "BR",
    chhattisgarh: "CG",
    goa: "GA",
    gujarat: "GJ",
    haryana: "HR",
    "himachal pradesh": "HP",
    jharkhand: "JH",
    karnataka: "KA",
    kerala: "KL",
    "madhya pradesh": "MP",
    maharashtra: "MH",
    manipur: "MN",
    meghalaya: "ML",
    mizoram: "MZ",
    nagaland: "NL",
    odisha: "OD",
    punjab: "PB",
    rajasthan: "RJ",
    sikkim: "SK",
    "tamil nadu": "TN",
    telangana: "TS",
    tripura: "TR",
    "uttar pradesh": "UP",
    uttarakhand: "UK",
    "west bengal": "WB",
    delhi: "DL",
    chandigarh: "CH",
    puducherry: "PY",
    "jammu and kashmir": "JK",
    ladakh: "LA",
    "andaman and nicobar islands": "AN",
    "dadra and nagar haveli and daman and diu": "DN",
    lakshadweep: "LD"
  };
  if (normalizedCountry === "US") {
    return usStates[normalizedRegion] ?? "";
  }
  if (normalizedCountry === "IN") {
    return indiaStates[normalizedRegion] ?? "";
  }
  if (region.trim().length >= 2 && region.trim().length <= 3) {
    return region.trim().toUpperCase();
  }
  return "";
}
__name(getRegionCode, "getRegionCode");
function cityFromAddress(address) {
  return address.city ?? address.town ?? address.village ?? address.municipality ?? address.county ?? "";
}
__name(cityFromAddress, "cityFromAddress");
function regionFromAddress(address) {
  return address.state ?? address.state_district ?? "";
}
__name(regionFromAddress, "regionFromAddress");
function mapResult(result) {
  const latitude = Number(
    result.lat
  );
  const longitude = Number(
    result.lon
  );
  if (!Number.isFinite(
    latitude
  ) || !Number.isFinite(
    longitude
  )) {
    return null;
  }
  const address = result.address ?? {};
  const city = cityFromAddress(
    address
  );
  const region = regionFromAddress(
    address
  );
  const countryCode = String(
    address.country_code ?? ""
  ).trim().toUpperCase();
  const regionCode = getRegionCode(
    region,
    countryCode
  );
  const label = [
    city,
    region,
    address.country
  ].filter(Boolean).join(", ") || result.display_name || `${latitude.toFixed(
    4
  )}, ${longitude.toFixed(
    4
  )}`;
  return {
    latitude,
    longitude,
    label,
    city,
    region,
    regionCode,
    countryCode,
    phoneCountryCode: getPhoneCountryCode(
      countryCode
    ),
    postalCode: address.postcode ?? ""
  };
}
__name(mapResult, "mapResult");
async function geocoderFetch(url) {
  return fetch(
    url.toString(),
    {
      headers: {
        "user-agent": "GYAN/1.0 (https://gyan.cc)",
        accept: "application/json"
      }
    }
  );
}
__name(geocoderFetch, "geocoderFetch");
async function reverseGeocode(latitude, longitude) {
  const endpoint = new URL(
    "https://nominatim.openstreetmap.org/reverse"
  );
  endpoint.searchParams.set(
    "format",
    "jsonv2"
  );
  endpoint.searchParams.set(
    "addressdetails",
    "1"
  );
  endpoint.searchParams.set(
    "lat",
    String(
      latitude
    )
  );
  endpoint.searchParams.set(
    "lon",
    String(
      longitude
    )
  );
  const response = await geocoderFetch(
    endpoint
  );
  if (!response.ok) {
    return null;
  }
  const result = await response.json();
  return mapResult(
    result
  );
}
__name(reverseGeocode, "reverseGeocode");
async function forwardGeocode(city, region, country) {
  const endpoint = new URL(
    "https://nominatim.openstreetmap.org/search"
  );
  endpoint.searchParams.set(
    "format",
    "jsonv2"
  );
  endpoint.searchParams.set(
    "addressdetails",
    "1"
  );
  endpoint.searchParams.set(
    "limit",
    "1"
  );
  endpoint.searchParams.set(
    "q",
    [
      city,
      region,
      country
    ].filter(Boolean).join(", ")
  );
  const response = await geocoderFetch(
    endpoint
  );
  if (!response.ok) {
    return null;
  }
  const results = await response.json();
  if (results.length === 0) {
    return null;
  }
  return mapResult(
    results[0]
  );
}
__name(forwardGeocode, "forwardGeocode");
async function handleLocationResolveRoute(request, url) {
  if (request.method !== "GET" || url.pathname !== "/api/location/resolve") {
    return null;
  }
  const rawLat = url.searchParams.get(
    "lat"
  );
  const rawLng = url.searchParams.get(
    "lng"
  );
  const city = (url.searchParams.get(
    "city"
  ) ?? "").trim();
  const region = (url.searchParams.get(
    "region"
  ) ?? "").trim();
  const country = (url.searchParams.get(
    "country"
  ) ?? "").trim();
  const hasLat = rawLat !== null && rawLat.trim() !== "";
  const hasLng = rawLng !== null && rawLng.trim() !== "";
  if (hasLat !== hasLng) {
    return jsonResponse3(
      {
        error: "Enter both latitude and longitude."
      },
      400
    );
  }
  try {
    let resolved = null;
    if (hasLat && hasLng) {
      const latitude = Number(
        rawLat
      );
      const longitude = Number(
        rawLng
      );
      if (!Number.isFinite(
        latitude
      ) || latitude < -90 || latitude > 90 || !Number.isFinite(
        longitude
      ) || longitude < -180 || longitude > 180) {
        return jsonResponse3(
          {
            error: "Enter valid latitude and longitude values."
          },
          400
        );
      }
      resolved = await reverseGeocode(
        latitude,
        longitude
      );
    } else {
      if (!city || !region) {
        return jsonResponse3(
          {
            error: "Enter coordinates or a city and state / region."
          },
          400
        );
      }
      resolved = await forwardGeocode(
        city,
        region,
        country
      );
    }
    if (!resolved) {
      return jsonResponse3(
        {
          error: "Location could not be found. Check the city/state or enter coordinates."
        },
        404
      );
    }
    return jsonResponse3({
      location: resolved
    });
  } catch (error) {
    console.error(
      "Location resolution failed:",
      error
    );
    return jsonResponse3(
      {
        error: "Location lookup is temporarily unavailable."
      },
      502
    );
  }
}
__name(handleLocationResolveRoute, "handleLocationResolveRoute");

// worker/puzzle/puzzleRoutes.ts
init_modules_watch_stub();
function jsonResponse4(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse4, "jsonResponse");
function mapPublicPuzzle(row) {
  const board = JSON.parse(
    row.start_board_json
  );
  const publicBoard = board.map(
    (tile) => tile.hidden ? {
      id: tile.id,
      hidden: true
    } : {
      id: tile.id,
      hidden: false,
      color: tile.color
    }
  );
  return {
    puzzleDate: row.puzzle_date,
    puzzleNumber: row.puzzle_number,
    stage: row.stage,
    size: row.board_size,
    maxMoves: row.max_moves,
    mysteryCount: row.mystery_count,
    board: publicBoard
  };
}
__name(mapPublicPuzzle, "mapPublicPuzzle");
async function loadByNumber(env, puzzleNumber, stage) {
  return env.gyan_registry.prepare(
    `
      SELECT
        puzzle_date,
        puzzle_number,
        stage,
        board_size,
        max_moves,
        mystery_count,
        start_board_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_number = ?
        AND stage = ?
        AND verified = 1
        AND status = 'published'
        AND puzzle_date <= ?

      LIMIT 1
      `
  ).bind(
    puzzleNumber,
    stage,
    localDateKey()
  ).first();
}
__name(loadByNumber, "loadByNumber");
async function loadPublishedByDate(env, puzzleDate, stage) {
  return env.gyan_registry.prepare(
    `
      SELECT
        puzzle_date,
        puzzle_number,
        stage,
        board_size,
        max_moves,
        mystery_count,
        start_board_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_date = ?
        AND stage = ?
        AND verified = 1
        AND status = 'published'

      LIMIT 1
      `
  ).bind(
    puzzleDate,
    stage
  ).first();
}
__name(loadPublishedByDate, "loadPublishedByDate");
function localDateKey() {
  const now = /* @__PURE__ */ new Date();
  const year = now.getFullYear();
  const month = String(
    now.getMonth() + 1
  ).padStart(
    2,
    "0"
  );
  const day = String(
    now.getDate()
  ).padStart(
    2,
    "0"
  );
  return `${year}-${month}-${day}`;
}
__name(localDateKey, "localDateKey");
function buildAuthoritativeBoard(storedBoard, clientBoard) {
  const byId = new Map(
    storedBoard.map(
      (tile) => [
        tile.id,
        tile
      ]
    )
  );
  const seen = /* @__PURE__ */ new Set();
  return clientBoard.map(
    (clientTile) => {
      const stored = byId.get(
        clientTile.id
      );
      if (!stored || seen.has(
        clientTile.id
      )) {
        throw new Error(
          "Invalid tile."
        );
      }
      seen.add(
        clientTile.id
      );
      return {
        id: stored.id,
        color: stored.color,
        hidden: clientTile.hidden
      };
    }
  );
}
__name(buildAuthoritativeBoard, "buildAuthoritativeBoard");
async function handlePuzzleRoute(request, env, url) {
  const numbered = url.pathname.match(
    /^\/api\/puzzle\/(\d+)\/(5x5|7x7)$/
  );
  if (request.method === "GET" && numbered) {
    const puzzleNumber = Number(
      numbered[1]
    );
    const stage = numbered[2];
    const row = await loadByNumber(
      env,
      puzzleNumber,
      stage
    );
    if (!row) {
      return jsonResponse4(
        {
          error: "Puzzle not found."
        },
        404
      );
    }
    return jsonResponse4({
      puzzle: mapPublicPuzzle(
        row
      )
    });
  }
  if (request.method === "GET" && url.pathname === "/api/puzzle/today") {
    const rawStage = url.searchParams.get(
      "stage"
    );
    const stage = rawStage === "7x7" ? "7x7" : "5x5";
    const row = await loadPublishedByDate(
      env,
      localDateKey(),
      stage
    );
    if (!row) {
      return jsonResponse4(
        {
          error: "Today's puzzle is not available."
        },
        404
      );
    }
    return jsonResponse4({
      puzzle: mapPublicPuzzle(
        row
      )
    });
  }
  const practice = url.pathname.match(
    /^\/api\/puzzle\/practice\/(\d+)$/
  );
  if (request.method === "GET" && practice) {
    const puzzleNumber = Number(
      practice[1]
    );
    const row = await loadByNumber(
      env,
      puzzleNumber,
      "5x5"
    );
    if (!row) {
      return jsonResponse4(
        {
          error: "Practice puzzle not found."
        },
        404
      );
    }
    return jsonResponse4({
      practice: true,
      puzzle: mapPublicPuzzle(
        row
      )
    });
  }
  if (request.method === "POST" && url.pathname === "/api/puzzle/check-reveals") {
    const body = await request.json();
    if (!Number.isInteger(
      body.puzzleNumber
    ) || body.stage !== "5x5" && body.stage !== "7x7" || !Array.isArray(
      body.board
    )) {
      return jsonResponse4(
        {
          error: "Invalid reveal request."
        },
        400
      );
    }
    const row = await loadByNumber(
      env,
      body.puzzleNumber,
      body.stage
    );
    if (!row) {
      return jsonResponse4(
        {
          error: "Puzzle not found."
        },
        404
      );
    }
    const storedBoard = JSON.parse(
      row.start_board_json
    );
    if (body.board.length !== storedBoard.length) {
      return jsonResponse4(
        {
          error: "Invalid board size."
        },
        400
      );
    }
    let authoritative;
    try {
      authoritative = buildAuthoritativeBoard(
        storedBoard,
        body.board
      );
    } catch {
      return jsonResponse4(
        {
          error: "Invalid board."
        },
        400
      );
    }
    const hiddenTile = authoritative.find(
      (tile) => tile.hidden
    );
    if (!hiddenTile) {
      return jsonResponse4({
        revealed: []
      });
    }
    hiddenTile.hidden = false;
    return jsonResponse4({
      revealed: [
        {
          id: hiddenTile.id,
          color: hiddenTile.color
        }
      ]
    });
  }
  if (request.method === "POST" && url.pathname === "/api/puzzle/winner") {
    const body = await request.json();
    const puzzleNumber = Number(
      body.puzzleNumber
    );
    const name = String(
      body.name ?? ""
    ).trim();
    const email = String(
      body.email ?? ""
    ).trim().toLowerCase();
    if (!Number.isInteger(
      puzzleNumber
    ) || puzzleNumber <= 0) {
      return jsonResponse4(
        {
          error: "Invalid puzzle number."
        },
        400
      );
    }
    if (name.length < 2 || name.length > 80) {
      return jsonResponse4(
        {
          error: "Please enter your display name."
        },
        400
      );
    }
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(
      email
    )) {
      return jsonResponse4(
        {
          error: "Please enter a valid email address."
        },
        400
      );
    }
    const puzzle = await env.gyan_registry.prepare(
      `
          SELECT
            puzzle_date,
            puzzle_number

          FROM daily_puzzles

          WHERE
            puzzle_number = ?
            AND stage = '7x7'
            AND verified = 1

          LIMIT 1
          `
    ).bind(
      puzzleNumber
    ).first();
    if (!puzzle) {
      return jsonResponse4(
        {
          error: "Puzzle not found."
        },
        404
      );
    }
    const existing = await env.gyan_registry.prepare(
      `
          SELECT
            id,
            name

          FROM puzzle_winners

          WHERE
            puzzle_number = ?
            AND email = ?

          LIMIT 1
          `
    ).bind(
      puzzleNumber,
      email
    ).first();
    if (existing) {
      return jsonResponse4({
        claimed: true,
        alreadyClaimed: true,
        winner: {
          name: existing.name
        }
      });
    }
    try {
      await env.gyan_registry.prepare(
        `
          INSERT INTO puzzle_winners (
            puzzle_number,
            puzzle_date,
            name,
            email
          )
          VALUES (
            ?,
            ?,
            ?,
            ?
          )
          `
      ).bind(
        puzzleNumber,
        puzzle.puzzle_date,
        name,
        email
      ).run();
    } catch {
      return jsonResponse4(
        {
          error: "Unable to save medal."
        },
        500
      );
    }
    return jsonResponse4({
      claimed: true,
      alreadyClaimed: false,
      winner: {
        name
      }
    });
  }
  const winnersMatch = url.pathname.match(
    /^\/api\/puzzle\/(\d+)\/winners$/
  );
  if (request.method === "GET" && winnersMatch) {
    const puzzleNumber = Number(
      winnersMatch[1]
    );
    if (!Number.isInteger(
      puzzleNumber
    ) || puzzleNumber <= 0) {
      return jsonResponse4(
        {
          error: "Invalid puzzle number."
        },
        400
      );
    }
    const firstWinner = await env.gyan_registry.prepare(
      `
          SELECT
            name,
            created_at

          FROM puzzle_winners

          WHERE
            puzzle_number = ?

          ORDER BY
            created_at ASC,
            id ASC

          LIMIT 1
          `
    ).bind(
      puzzleNumber
    ).first();
    const latestWinner = await env.gyan_registry.prepare(
      `
          SELECT
            name,
            created_at

          FROM puzzle_winners

          WHERE
            puzzle_number = ?

          ORDER BY
            created_at DESC,
            id DESC

          LIMIT 1
          `
    ).bind(
      puzzleNumber
    ).first();
    const recentResult = await env.gyan_registry.prepare(
      `
          SELECT
            name,
            created_at

          FROM puzzle_winners

          WHERE
            puzzle_number = ?

          ORDER BY
            created_at DESC,
            id DESC

          LIMIT 5
          `
    ).bind(
      puzzleNumber
    ).all();
    const countResult = await env.gyan_registry.prepare(
      `
          SELECT
            COUNT(*) AS count

          FROM puzzle_winners

          WHERE
            puzzle_number = ?
          `
    ).bind(
      puzzleNumber
    ).first();
    return jsonResponse4({
      puzzleNumber,
      count: countResult?.count ?? 0,
      firstWinner: firstWinner ? {
        name: firstWinner.name,
        claimedAt: firstWinner.created_at
      } : null,
      latestWinner: latestWinner ? {
        name: latestWinner.name,
        claimedAt: latestWinner.created_at
      } : null,
      recentWinners: (recentResult.results ?? []).map(
        (winner) => ({
          name: winner.name,
          claimedAt: winner.created_at
        })
      )
    });
  }
  return null;
}
__name(handlePuzzleRoute, "handlePuzzleRoute");

// worker/puzzle/puzzleAdminRoutes.ts
init_modules_watch_stub();
function jsonResponse5(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse5, "jsonResponse");
async function requireAdmin5(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (!session) {
    return jsonResponse5(
      {
        error: "Administrator authentication is required."
      },
      401
    );
  }
  return null;
}
__name(requireAdmin5, "requireAdmin");
function mapAdminPuzzle(row) {
  return {
    puzzleDate: row.puzzle_date,
    puzzleNumber: row.puzzle_number,
    stage: row.stage,
    size: row.board_size,
    maxMoves: row.max_moves,
    mysteryCount: row.mystery_count,
    scrambledBoard: JSON.parse(
      row.start_board_json
    ),
    solvedBoard: JSON.parse(
      row.solved_board_json
    ),
    solutionMoves: JSON.parse(
      row.solution_moves_json
    ),
    verified: row.verified === 1,
    status: row.status
  };
}
__name(mapAdminPuzzle, "mapAdminPuzzle");
async function loadStage(env, puzzleNumber, stage) {
  return env.gyan_registry.prepare(
    `
      SELECT
        puzzle_date,
        puzzle_number,
        stage,
        board_size,
        max_moves,
        mystery_count,
        start_board_json,
        solved_board_json,
        solution_moves_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_number = ?
        AND stage = ?

      LIMIT 1
      `
  ).bind(
    puzzleNumber,
    stage
  ).first();
}
__name(loadStage, "loadStage");
async function handlePuzzleAdminRoute(request, env, url) {
  const match = url.pathname.match(
    /^\/api\/admin\/puzzles\/(\d+)$/
  );
  if (request.method !== "GET" || !match) {
    return null;
  }
  const unauthorizedResponse = await requireAdmin5(
    request,
    env
  );
  if (unauthorizedResponse) {
    return unauthorizedResponse;
  }
  const puzzleNumber = Number(
    match[1]
  );
  if (!Number.isInteger(
    puzzleNumber
  ) || puzzleNumber <= 0) {
    return jsonResponse5(
      {
        error: "Invalid puzzle number."
      },
      400
    );
  }
  const [
    five,
    seven
  ] = await Promise.all([
    loadStage(
      env,
      puzzleNumber,
      "5x5"
    ),
    loadStage(
      env,
      puzzleNumber,
      "7x7"
    )
  ]);
  if (!five && !seven) {
    return jsonResponse5(
      {
        error: "Puzzle not found."
      },
      404
    );
  }
  return jsonResponse5({
    puzzleNumber,
    five: five ? mapAdminPuzzle(
      five
    ) : null,
    seven: seven ? mapAdminPuzzle(
      seven
    ) : null
  });
}
__name(handlePuzzleAdminRoute, "handlePuzzleAdminRoute");

// worker/puzzle/puzzleCertificate.ts
init_modules_watch_stub();
var import_qrcode = __toESM(require_browser(), 1);

// worker/puzzle/puzzleGenerator.ts
init_modules_watch_stub();
function indexOf(row, column, size) {
  return row * size + column;
}
__name(indexOf, "indexOf");
function cloneBoard(board) {
  return board.map(
    (tile) => ({
      ...tile
    })
  );
}
__name(cloneBoard, "cloneBoard");
function countDirection(board, size, row, column, rowDelta, columnDelta, color) {
  let count = 0;
  let currentRow = row + rowDelta;
  let currentColumn = column + columnDelta;
  while (currentRow >= 0 && currentRow < size && currentColumn >= 0 && currentColumn < size) {
    const tile = board[indexOf(
      currentRow,
      currentColumn,
      size
    )];
    if (tile.hidden || tile.color !== color) {
      break;
    }
    count += 1;
    currentRow += rowDelta;
    currentColumn += columnDelta;
  }
  return count;
}
__name(countDirection, "countDirection");
function shouldRevealMystery(board, size, tileIndex) {
  const tile = board[tileIndex];
  if (!tile || !tile.hidden) {
    return false;
  }
  const row = Math.floor(
    tileIndex / size
  );
  const column = tileIndex % size;
  const horizontal = countDirection(
    board,
    size,
    row,
    column,
    0,
    -1,
    tile.color
  ) + countDirection(
    board,
    size,
    row,
    column,
    0,
    1,
    tile.color
  );
  const vertical = countDirection(
    board,
    size,
    row,
    column,
    -1,
    0,
    tile.color
  ) + countDirection(
    board,
    size,
    row,
    column,
    1,
    0,
    tile.color
  );
  return horizontal >= 3 || vertical >= 3;
}
__name(shouldRevealMystery, "shouldRevealMystery");
function revealEligibleMysteries(board, size) {
  const next = cloneBoard(
    board
  );
  let changed = true;
  while (changed) {
    changed = false;
    for (let index = 0; index < next.length; index += 1) {
      if (shouldRevealMystery(
        next,
        size,
        index
      )) {
        next[index] = {
          ...next[index],
          hidden: false
        };
        changed = true;
      }
    }
  }
  return next;
}
__name(revealEligibleMysteries, "revealEligibleMysteries");

// worker/emailTemplates/puzzleCertificateEmail.ts
init_modules_watch_stub();
function tileBackground(tile) {
  if (tile.hidden) {
    return "#ece5d6";
  }
  switch (tile.color) {
    case "red":
      return "#ef5350";
    case "blue":
      return "#42a5f5";
    case "green":
      return "#66bb6a";
    case "yellow":
      return "#fdd835";
    case "purple":
      return "#ab47bc";
    case "orange":
      return "#ffa726";
    default:
      return "#ece5d6";
  }
}
__name(tileBackground, "tileBackground");
function renderBoard(board) {
  const rows = [];
  for (let row = 0; row < 5; row += 1) {
    const cells = board.slice(
      row * 5,
      row * 5 + 5
    ).map(
      (tile) => `
            <td
              width="30"
              height="30"
              style="
                width:30px;
                height:30px;
                padding:0;
                background:${tileBackground(
        tile
      )};
                border:2px solid #fffdf8;
                border-radius:4px;
                color:#5f5543;
                font-family:Arial,sans-serif;
                font-size:13px;
                font-weight:700;
                text-align:center;
                vertical-align:middle;
              "
            >
              ${tile.hidden ? "?" : "&nbsp;"}
            </td>
          `
    ).join("");
    rows.push(
      `<tr>${cells}</tr>`
    );
  }
  return rows.join("");
}
__name(renderBoard, "renderBoard");
function renderQr(modules) {
  const rows = modules.map(
    (row) => `
          <tr>
            ${row.map(
      (dark) => `
                  <td
                    width="3"
                    height="3"
                    style="
                      width:3px;
                      height:3px;
                      min-width:3px;
                      max-width:3px;
                      padding:0;
                      margin:0;
                      border:0;
                      line-height:0;
                      font-size:0;
                      background:${dark ? "#000000" : "#ffffff"};
                    "
                  ></td>
                `
    ).join("")}
          </tr>
        `
  ).join("");
  return `
    <table
      role="presentation"
      cellspacing="0"
      cellpadding="0"
      border="0"
      style="
        margin-left:auto;
        border-collapse:collapse;
        border-spacing:0;
        background:#ffffff;
        border:10px solid #ffffff;
      "
    >
      ${rows}
    </table>
  `;
}
__name(renderQr, "renderQr");
function renderPuzzleCertificateEmail(input) {
  const subject = `GYAN Puzzle #${input.puzzleNumber} (5\xD75) \u2014 Certificate of Completion`;
  const html = `
    <!doctype html>

    <html>
      <body
        style="
          margin:0;
          padding:0;
          background:#f4f1eb;
        "
      >
        <div
          style="
            max-width:520px;
            margin:0 auto;
            padding:24px 14px;
          "
        >
          <div
            style="
              padding:20px;
              background:#fffdf8;
              border:1px solid #e5d9b8;
              border-radius:16px;
              font-family:Arial,sans-serif;
              color:#102a56;
            "
          >

            <!-- =========================================
                 GYAN + QR
                 ========================================= -->

            <table
              role="presentation"
              width="100%"
              cellspacing="0"
              cellpadding="0"
              border="0"
              style="
                width:100%;
                border-collapse:collapse;
              "
            >
              <tr>

                <td
                  style="
                    text-align:left;
                    vertical-align:top;
                  "
                >
                  <div
                    style="
                      font-size:20px;
                      font-weight:800;
                    "
                  >
                    \u{1F4D6} GYAN
                  </div>

                  <div
                    style="
                      margin-top:2px;
                      color:#7a8492;
                      font-size:11px;
                    "
                  >
                    Daily Puzzle
                  </div>
                </td>


                <td
                  style="
                    text-align:right;
                    vertical-align:top;
                  "
                >
                  ${renderQr(
    input.qrModules
  )}
                </td>

              </tr>
            </table>


            <!-- =========================================
                 TITLE
                 ========================================= -->

            <div
              style="
                margin-top:12px;
                color:#9b7413;
                font-size:11px;
                font-weight:800;
                letter-spacing:1.2px;
                text-align:center;
              "
            >
              CERTIFICATE OF COMPLETION
            </div>


            <div
              style="
                margin-top:7px;
                font-size:22px;
                font-weight:800;
                text-align:center;
              "
            >
              \u{1F393} Puzzle Solver
            </div>


            <div
              style="
                margin-top:5px;
                color:#677487;
                font-size:14px;
                font-weight:700;
                text-align:center;
              "
            >
              GYAN Puzzle #${input.puzzleNumber} (5\xD75)
            </div>


            <!-- =========================================
                 SOLVED BOARD
                 ========================================= -->

            <table
              role="presentation"
              cellspacing="0"
              cellpadding="0"
              border="0"
              style="
                margin:18px auto 14px;
                border-collapse:separate;
                border-spacing:2px;
              "
            >
              ${renderBoard(
    input.board
  )}
            </table>


            <!-- =========================================
                 DATE
                 ========================================= -->

            <div
              style="
                color:#7a8492;
                font-size:11px;
                text-align:center;
              "
            >
              ${input.puzzleDate}
            </div>


            <!-- =========================================
                 PLAY AGAIN
                 ========================================= -->

            <div
              style="
                margin-top:16px;
                text-align:center;
              "
            >
              <a
                href="https://gyan.cc"
                style="
                  display:inline-block;
                  padding:10px 18px;
                  background:#1976d2;
                  border-radius:9px;
                  color:#ffffff;
                  font-size:13px;
                  font-weight:700;
                  text-decoration:none;
                "
              >
                Play today's GYAN Puzzle
              </a>
            </div>


            <!-- =========================================
                 FOOTER
                 ========================================= -->

            <div
              style="
                margin-top:17px;
                color:#8a8d92;
                font-size:11px;
                text-align:center;
              "
            >
              gyan.cc
            </div>

          </div>
        </div>
      </body>
    </html>
  `;
  const text = [
    "GYAN",
    "Certificate of Completion",
    "",
    "Puzzle Solver",
    `GYAN Puzzle #${input.puzzleNumber} (5\xD75)`,
    input.puzzleDate,
    "",
    "Play today's GYAN Puzzle:",
    "https://gyan.cc"
  ].join(
    "\n"
  );
  return {
    subject,
    html,
    text
  };
}
__name(renderPuzzleCertificateEmail, "renderPuzzleCertificateEmail");

// worker/puzzle/puzzleCertificate.ts
var ADMIN_EMAIL = "admin@gyan.cc";
function jsonResponse6(data, status = 200) {
  return new Response(
    JSON.stringify(
      data
    ),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse6, "jsonResponse");
function normalizeEmail3(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toLowerCase();
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeEmail3, "normalizeEmail");
function normalizePuzzleNumber(value) {
  if (typeof value !== "number" || !Number.isInteger(
    value
  ) || value <= 0) {
    return null;
  }
  return value;
}
__name(normalizePuzzleNumber, "normalizePuzzleNumber");
function normalizePosition(value) {
  if (typeof value !== "object" || value === null || Array.isArray(
    value
  )) {
    return null;
  }
  const candidate = value;
  if (typeof candidate.row !== "number" || typeof candidate.column !== "number" || !Number.isInteger(
    candidate.row
  ) || !Number.isInteger(
    candidate.column
  )) {
    return null;
  }
  return {
    row: candidate.row,
    column: candidate.column
  };
}
__name(normalizePosition, "normalizePosition");
function normalizeMoves(value) {
  if (!Array.isArray(
    value
  )) {
    return null;
  }
  const moves = [];
  for (const item of value) {
    if (typeof item !== "object" || item === null || Array.isArray(
      item
    )) {
      return null;
    }
    const candidate = item;
    const from = normalizePosition(
      candidate.from
    );
    const to = normalizePosition(
      candidate.to
    );
    if (!from || !to) {
      return null;
    }
    moves.push({
      from,
      to
    });
  }
  return moves;
}
__name(normalizeMoves, "normalizeMoves");
function indexOf2(row, column, size) {
  return row * size + column;
}
__name(indexOf2, "indexOf");
function validPosition(position, size) {
  return position.row >= 0 && position.row < size && position.column >= 0 && position.column < size;
}
__name(validPosition, "validPosition");
function adjacent(first, second) {
  return Math.abs(
    first.row - second.row
  ) + Math.abs(
    first.column - second.column
  ) === 1;
}
__name(adjacent, "adjacent");
function cloneBoard2(board) {
  return board.map(
    (tile) => ({
      ...tile
    })
  );
}
__name(cloneBoard2, "cloneBoard");
function swap(board, move, size) {
  const next = cloneBoard2(
    board
  );
  const first = indexOf2(
    move.from.row,
    move.from.column,
    size
  );
  const second = indexOf2(
    move.to.row,
    move.to.column,
    size
  );
  [
    next[first],
    next[second]
  ] = [
    next[second],
    next[first]
  ];
  return next;
}
__name(swap, "swap");
function longestVisibleMatch(board, size) {
  let best = 1;
  for (let row = 0; row < size; row += 1) {
    let length = 1;
    for (let column = 1; column < size; column += 1) {
      const previous = board[indexOf2(
        row,
        column - 1,
        size
      )];
      const current = board[indexOf2(
        row,
        column,
        size
      )];
      if (!previous.hidden && !current.hidden && previous.color === current.color) {
        length += 1;
        best = Math.max(
          best,
          length
        );
      } else {
        length = 1;
      }
    }
  }
  for (let column = 0; column < size; column += 1) {
    let length = 1;
    for (let row = 1; row < size; row += 1) {
      const previous = board[indexOf2(
        row - 1,
        column,
        size
      )];
      const current = board[indexOf2(
        row,
        column,
        size
      )];
      if (!previous.hidden && !current.hidden && previous.color === current.color) {
        length += 1;
        best = Math.max(
          best,
          length
        );
      } else {
        length = 1;
      }
    }
  }
  return best;
}
__name(longestVisibleMatch, "longestVisibleMatch");
async function loadPuzzle(env, puzzleNumber) {
  return env.gyan_registry.prepare(
    `
      SELECT
        puzzle_number,
        puzzle_date,
        board_size,
        max_moves,
        start_board_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_number = ?
        AND stage = '5x5'
        AND verified = 1
        AND status = 'published'

      LIMIT 1
      `
  ).bind(
    puzzleNumber
  ).first();
}
__name(loadPuzzle, "loadPuzzle");
function replaySolution(row, moves) {
  if (row.board_size !== 5 || moves.length === 0 || moves.length > row.max_moves) {
    return null;
  }
  let board = JSON.parse(
    row.start_board_json
  );
  board = cloneBoard2(
    board
  );
  for (const move of moves) {
    if (!validPosition(
      move.from,
      row.board_size
    ) || !validPosition(
      move.to,
      row.board_size
    ) || !adjacent(
      move.from,
      move.to
    )) {
      return null;
    }
    board = swap(
      board,
      move,
      row.board_size
    );
    board = revealEligibleMysteries(
      board,
      row.board_size
    );
  }
  if (longestVisibleMatch(
    board,
    row.board_size
  ) < row.board_size) {
    return null;
  }
  return board;
}
__name(replaySolution, "replaySolution");
function createQrModules() {
  const qr = import_qrcode.default.create(
    "https://gyan.cc",
    {
      errorCorrectionLevel: "M"
    }
  );
  const modules = [];
  for (let row = 0; row < qr.modules.size; row += 1) {
    const moduleRow = [];
    for (let column = 0; column < qr.modules.size; column += 1) {
      moduleRow.push(
        qr.modules.get(
          row,
          column
        ) === 1
      );
    }
    modules.push(
      moduleRow
    );
  }
  return modules;
}
__name(createQrModules, "createQrModules");
async function sendCertificate(env, email, row, solvedBoard) {
  if (!env.RESEND_API_KEY) {
    return {
      sent: false,
      reason: "RESEND_API_KEY is not configured."
    };
  }
  const qrModules = createQrModules();
  const rendered = renderPuzzleCertificateEmail({
    puzzleNumber: row.puzzle_number,
    puzzleDate: row.puzzle_date,
    board: solvedBoard,
    qrModules
  });
  const bcc = email === ADMIN_EMAIL ? void 0 : [
    ADMIN_EMAIL
  ];
  try {
    const response = await fetch(
      "https://api.resend.com/emails",
      {
        method: "POST",
        headers: {
          authorization: `Bearer ${env.RESEND_API_KEY}`,
          "content-type": "application/json"
        },
        body: JSON.stringify({
          from: "GYAN Puzzle <admin@gyan.cc>",
          to: [
            email
          ],
          bcc,
          subject: rendered.subject,
          html: rendered.html,
          text: rendered.text
        })
      }
    );
    const result = await response.json();
    if (!response.ok) {
      return {
        sent: false,
        reason: result.message ?? result.error?.message ?? "The email provider rejected the message."
      };
    }
    return {
      sent: true
    };
  } catch (error) {
    return {
      sent: false,
      reason: error instanceof Error ? error.message : "Unexpected email error."
    };
  }
}
__name(sendCertificate, "sendCertificate");
async function handlePuzzleCertificateRoute(request, env, url) {
  if (request.method !== "POST" || url.pathname !== "/api/puzzle/certificate") {
    return null;
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return jsonResponse6(
      {
        sent: false,
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const puzzleNumber = normalizePuzzleNumber(
    body.puzzleNumber
  );
  const email = normalizeEmail3(
    body.email
  );
  const moves = normalizeMoves(
    body.moves
  );
  if (!puzzleNumber) {
    return jsonResponse6(
      {
        sent: false,
        error: "Invalid puzzle number."
      },
      400
    );
  }
  if (!email) {
    return jsonResponse6(
      {
        sent: false,
        error: "Please provide a valid email address."
      },
      400
    );
  }
  if (!moves) {
    return jsonResponse6(
      {
        sent: false,
        error: "Invalid puzzle moves."
      },
      400
    );
  }
  const row = await loadPuzzle(
    env,
    puzzleNumber
  );
  if (!row) {
    return jsonResponse6(
      {
        sent: false,
        error: "Puzzle not found."
      },
      404
    );
  }
  const solvedBoard = replaySolution(
    row,
    moves
  );
  if (!solvedBoard) {
    return jsonResponse6(
      {
        sent: false,
        error: "Puzzle completion could not be verified."
      },
      403
    );
  }
  const delivery = await sendCertificate(
    env,
    email,
    row,
    solvedBoard
  );
  if (!delivery.sent) {
    console.error(
      "Puzzle certificate email failed:",
      delivery.reason
    );
    return jsonResponse6(
      {
        sent: false,
        error: "Certificate could not be sent."
      },
      502
    );
  }
  return jsonResponse6({
    sent: true
  });
}
__name(handlePuzzleCertificateRoute, "handlePuzzleCertificateRoute");

// worker/homeFeatured.ts
init_modules_watch_stub();
var DEFAULT_FEATURED_SHOP_DISTANCE_KM = 5;
var DEFAULT_LOCAL_AD_LIMIT = 3;
var MAX_LOCAL_AD_LIMIT = 10;
function jsonResponse7(data, status = 200) {
  return new Response(
    JSON.stringify(
      data
    ),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse7, "jsonResponse");
function getMaxFeaturedShopDistanceKm(env) {
  const configured = Number(
    env.FEATURED_SHOP_DISTANCE_KM
  );
  if (Number.isFinite(
    configured
  ) && configured > 0) {
    return configured;
  }
  return DEFAULT_FEATURED_SHOP_DISTANCE_KM;
}
__name(getMaxFeaturedShopDistanceKm, "getMaxFeaturedShopDistanceKm");
function getRequestedLimit(url) {
  const requested = Number(
    url.searchParams.get(
      "limit"
    )
  );
  if (!Number.isFinite(
    requested
  ) || requested <= 0) {
    return DEFAULT_LOCAL_AD_LIMIT;
  }
  return Math.min(
    Math.floor(
      requested
    ),
    MAX_LOCAL_AD_LIMIT
  );
}
__name(getRequestedLimit, "getRequestedLimit");
function parseCoordinate(value) {
  if (value == null || value.trim() === "") {
    return null;
  }
  const parsed = Number(
    value
  );
  return Number.isFinite(
    parsed
  ) ? parsed : null;
}
__name(parseCoordinate, "parseCoordinate");
function toRadians(value) {
  return value * Math.PI / 180;
}
__name(toRadians, "toRadians");
function calculateDistanceKm2(firstLatitude, firstLongitude, secondLatitude, secondLongitude) {
  const earthRadiusKm = 6371;
  const latitudeDifference = toRadians(
    secondLatitude - firstLatitude
  );
  const longitudeDifference = toRadians(
    secondLongitude - firstLongitude
  );
  const firstLatitudeRadians = toRadians(
    firstLatitude
  );
  const secondLatitudeRadians = toRadians(
    secondLatitude
  );
  const value = Math.sin(
    latitudeDifference / 2
  ) ** 2 + Math.cos(
    firstLatitudeRadians
  ) * Math.cos(
    secondLatitudeRadians
  ) * Math.sin(
    longitudeDifference / 2
  ) ** 2;
  return earthRadiusKm * 2 * Math.atan2(
    Math.sqrt(
      value
    ),
    Math.sqrt(
      1 - value
    )
  );
}
__name(calculateDistanceKm2, "calculateDistanceKm");
function mapPromotion(row, distanceKm2) {
  return {
    id: row.id,
    source: row.source_type,
    title: row.title,
    description: row.description ?? "",
    icon: row.icon ?? "\u2B50",
    imageUrl: row.image_url,
    ctaLabel: row.cta_label,
    targetUrl: row.target_url,
    serviceCode: row.service_code,
    shopCode: row.shop_code,
    shopName: null,
    offerText: row.offer_text,
    discountPercent: row.discount_percent,
    distanceKm: distanceKm2
  };
}
__name(mapPromotion, "mapPromotion");
async function loadActivePromotions(env) {
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          id,
          source_type,
          title,
          description,
          icon,
          image_url,
          cta_label,
          target_url,
          service_code,
          shop_code,
          latitude,
          longitude,
          radius_km,
          priority,
          offer_text,
          discount_percent

        FROM featured_promotions

        WHERE
          enabled = 1

AND (
  starts_at IS NULL
  OR datetime(starts_at) <= CURRENT_TIMESTAMP
)

AND (
  ends_at IS NULL
  OR datetime(ends_at) >= CURRENT_TIMESTAMP
)

        ORDER BY
          priority DESC,
          id DESC
        `
  ).all();
  return result.results ?? [];
}
__name(loadActivePromotions, "loadActivePromotions");
function rankLocalPromotions(promotions, latitude, longitude) {
  return promotions.filter(
    (promotion) => promotion.source_type === "gyan" && promotion.latitude != null && promotion.longitude != null && promotion.radius_km != null
  ).map(
    (promotion) => {
      const distanceKm2 = calculateDistanceKm2(
        latitude,
        longitude,
        promotion.latitude,
        promotion.longitude
      );
      return {
        promotion,
        distanceKm: distanceKm2
      };
    }
  ).filter(
    (candidate) => candidate.distanceKm <= candidate.promotion.radius_km
  ).sort(
    (first, second) => {
      const distanceDifference = first.distanceKm - second.distanceKm;
      if (Math.abs(
        distanceDifference
      ) > 1e-3) {
        return distanceDifference;
      }
      const firstDiscount = first.promotion.discount_percent ?? 0;
      const secondDiscount = second.promotion.discount_percent ?? 0;
      if (firstDiscount !== secondDiscount) {
        return secondDiscount - firstDiscount;
      }
      if (first.promotion.priority !== second.promotion.priority) {
        return second.promotion.priority - first.promotion.priority;
      }
      return second.promotion.id - first.promotion.id;
    }
  );
}
__name(rankLocalPromotions, "rankLocalPromotions");
async function loadShopServices2(env) {
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          sh.code
            AS shop_code,

          sh.name
            AS shop_name,

          sh.latitude,

          sh.longitude,

          s.service_code,

          COALESCE(
            ss.display_name,
            s.name
          )
            AS service_name,

          COALESCE(
            ss.description_override,
            s.description
          )
            AS service_description,

          COALESCE(
            ss.icon_override,
            s.icon
          )
            AS service_icon,

          ss.sort_order

        FROM shops sh

        JOIN shop_services ss
          ON ss.shop_code =
             sh.code

        JOIN services s
          ON s.id =
             ss.service_id

        WHERE
          sh.status =
            'active'

          AND sh.code !=
            'SUPP'

          AND sh.latitude
            IS NOT NULL

          AND sh.longitude
            IS NOT NULL

          AND ss.enabled =
            1

          AND s.enabled =
            1

        ORDER BY
          sh.code,
          ss.sort_order,
          ss.id
        `
  ).all();
  return result.results ?? [];
}
__name(loadShopServices2, "loadShopServices");
async function findNearestShopFeatured(env, latitude, longitude) {
  const rows = await loadShopServices2(
    env
  );
  const maxDistanceKm = getMaxFeaturedShopDistanceKm(
    env
  );
  const firstServiceByShop = /* @__PURE__ */ new Map();
  for (const row of rows) {
    if (!firstServiceByShop.has(
      row.shop_code
    )) {
      firstServiceByShop.set(
        row.shop_code,
        row
      );
    }
  }
  let nearest = null;
  for (const service of firstServiceByShop.values()) {
    const distanceKm2 = calculateDistanceKm2(
      latitude,
      longitude,
      service.latitude,
      service.longitude
    );
    if (distanceKm2 > maxDistanceKm) {
      continue;
    }
    if (!nearest || distanceKm2 < nearest.distanceKm) {
      nearest = {
        service,
        distanceKm: distanceKm2
      };
    }
  }
  if (!nearest) {
    return null;
  }
  return {
    source: "shop",
    title: nearest.service.service_name,
    description: nearest.service.service_description ?? `Available from ${nearest.service.shop_name}`,
    icon: nearest.service.service_icon ?? "\u{1F3EA}",
    imageUrl: null,
    ctaLabel: "Open",
    targetUrl: null,
    serviceCode: nearest.service.service_code,
    shopCode: nearest.service.shop_code,
    shopName: nearest.service.shop_name,
    offerText: null,
    discountPercent: null,
    distanceKm: nearest.distanceKm
  };
}
__name(findNearestShopFeatured, "findNearestShopFeatured");
function findOnlineFallback(promotions) {
  const fallback = promotions.find(
    (promotion) => promotion.source_type === "default"
  );
  if (!fallback) {
    return null;
  }
  return mapPromotion(
    fallback,
    null
  );
}
__name(findOnlineFallback, "findOnlineFallback");
function findAffiliateFallback(promotions) {
  const affiliate = promotions.find(
    (promotion) => (promotion.source_type === "groupon" || promotion.source_type === "woot" || promotion.source_type === "affiliate") && promotion.latitude == null && promotion.longitude == null
  );
  if (!affiliate) {
    return null;
  }
  return mapPromotion(
    affiliate,
    null
  );
}
__name(findAffiliateFallback, "findAffiliateFallback");
function findDefaultFallback(promotions) {
  const fallback = promotions.find(
    (promotion) => promotion.source_type === "default"
  );
  if (!fallback) {
    return null;
  }
  return mapPromotion(
    fallback,
    null
  );
}
__name(findDefaultFallback, "findDefaultFallback");
async function handleHomeFeaturedRoute(request, env, url) {
  if (request.method !== "GET" || url.pathname !== "/api/home-featured") {
    return null;
  }
  const latitude = parseCoordinate(
    url.searchParams.get(
      "lat"
    )
  );
  const longitude = parseCoordinate(
    url.searchParams.get(
      "lng"
    )
  );
  const requestedLimit = getRequestedLimit(
    url
  );
  const promotions = await loadActivePromotions(
    env
  );
  if (latitude != null && longitude != null) {
    const ranked = rankLocalPromotions(
      promotions,
      latitude,
      longitude
    );
    if (ranked.length > 0) {
      const physicalAds = ranked.slice(
        0,
        requestedLimit
      ).map(
        (candidate) => mapPromotion(
          candidate.promotion,
          candidate.distanceKm
        )
      );
      const otherCount = Math.max(
        0,
        ranked.length - physicalAds.length
      );
      const onlineFallback = ranked.length < 3 ? findOnlineFallback(
        promotions
      ) : null;
      return jsonResponse7({
        mode: "local_ads",
        physicalAds,
        onlineFallback,
        /*
         * UI can show the GYAN
         * introduction/video tile
         * when exactly one physical
         * advertisement exists.
         */
        showGyanTile: ranked.length === 1,
        otherCount,
        totalPhysicalAds: ranked.length,
        fallback: null
      });
    }
    const shopFeatured = await findNearestShopFeatured(
      env,
      latitude,
      longitude
    );
    if (shopFeatured) {
      return jsonResponse7({
        mode: "fallback",
        physicalAds: [],
        onlineFallback: null,
        showGyanTile: false,
        otherCount: 0,
        totalPhysicalAds: 0,
        fallback: shopFeatured
      });
    }
  }
  const affiliate = findAffiliateFallback(
    promotions
  );
  if (affiliate) {
    return jsonResponse7({
      mode: "fallback",
      physicalAds: [],
      onlineFallback: null,
      showGyanTile: false,
      otherCount: 0,
      totalPhysicalAds: 0,
      fallback: affiliate
    });
  }
  const defaultFallback = findDefaultFallback(
    promotions
  );
  if (defaultFallback) {
    return jsonResponse7({
      mode: "fallback",
      physicalAds: [],
      onlineFallback: null,
      showGyanTile: false,
      otherCount: 0,
      totalPhysicalAds: 0,
      fallback: defaultFallback
    });
  }
  return jsonResponse7({
    mode: "fallback",
    physicalAds: [],
    onlineFallback: null,
    showGyanTile: false,
    otherCount: 0,
    totalPhysicalAds: 0,
    fallback: null
  });
}
__name(handleHomeFeaturedRoute, "handleHomeFeaturedRoute");

// worker/advertisements.ts
init_modules_watch_stub();
function jsonResponse8(data, status = 200) {
  return new Response(
    JSON.stringify(
      data
    ),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse8, "jsonResponse");
function cleanText(value) {
  return (value ?? "").trim();
}
__name(cleanText, "cleanText");
function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    email
  );
}
__name(isValidEmail, "isValidEmail");
function milesToKm(miles) {
  return miles * 1.609344;
}
__name(milesToKm, "milesToKm");
function bytesToHex2(bytes) {
  return Array.from(
    bytes
  ).map(
    (value) => value.toString(16).padStart(
      2,
      "0"
    )
  ).join("");
}
__name(bytesToHex2, "bytesToHex");
function createToken() {
  const bytes = new Uint8Array(
    32
  );
  crypto.getRandomValues(
    bytes
  );
  return bytesToHex2(
    bytes
  );
}
__name(createToken, "createToken");
async function sha2562(value) {
  const encoded = new TextEncoder().encode(
    value
  );
  const digest = await crypto.subtle.digest(
    "SHA-256",
    encoded
  );
  return bytesToHex2(
    new Uint8Array(
      digest
    )
  );
}
__name(sha2562, "sha256");
function escapeHtml3(value) {
  return value.replaceAll(
    "&",
    "&amp;"
  ).replaceAll(
    "<",
    "&lt;"
  ).replaceAll(
    ">",
    "&gt;"
  ).replaceAll(
    '"',
    "&quot;"
  ).replaceAll(
    "'",
    "&#039;"
  );
}
__name(escapeHtml3, "escapeHtml");
async function sendEmail2(env, to, subject, html) {
  const response = await fetch(
    "https://api.resend.com/emails",
    {
      method: "POST",
      headers: {
        authorization: `Bearer ${env.RESEND_API_KEY}`,
        "content-type": "application/json"
      },
      body: JSON.stringify({
        from: "GYAN <admin@gyan.cc>",
        to: [
          to
        ],
        subject,
        html
      })
    }
  );
  if (!response.ok) {
    const message = await response.text();
    console.error(
      "Advertisement email failed:",
      message
    );
    throw new Error(
      "Email could not be sent."
    );
  }
}
__name(sendEmail2, "sendEmail");
async function createAdvertisement(request, env, url) {
  let body;
  try {
    body = await request.json();
  } catch {
    return jsonResponse8(
      {
        error: "Invalid request."
      },
      400
    );
  }
  const businessName = cleanText(
    body.businessName
  );
  const serviceName = cleanText(
    body.service
  );
  const offer = cleanText(
    body.offer
  );
  const phone = cleanText(
    body.phone
  );
  const email = cleanText(
    body.email
  ).toLowerCase();
  const description = cleanText(
    body.description
  );
  const latitude = Number(
    body.latitude
  );
  const longitude = Number(
    body.longitude
  );
  const city = cleanText(
    body.city
  );
  const region = cleanText(
    body.region
  );
  const regionCode = cleanText(
    body.regionCode
  ).toUpperCase();
  const countryCode = cleanText(
    body.countryCode
  ).toUpperCase();
  const postalCode = cleanText(
    body.postalCode
  );
  const distanceMiles = Number(
    body.distanceMiles
  );
  const durationDays = 30;
  const discountPercent = body.discountPercent == null ? null : Number(
    body.discountPercent
  );
  if (!businessName || !serviceName || !email) {
    return jsonResponse8(
      {
        error: "Business, service and email are required."
      },
      400
    );
  }
  if (!isValidEmail(
    email
  )) {
    return jsonResponse8(
      {
        error: "Enter a valid email address."
      },
      400
    );
  }
  if (!Number.isFinite(
    latitude
  ) || latitude < -90 || latitude > 90 || !Number.isFinite(
    longitude
  ) || longitude < -180 || longitude > 180) {
    return jsonResponse8(
      {
        error: "A valid location is required."
      },
      400
    );
  }
  if (!Number.isFinite(
    distanceMiles
  ) || distanceMiles <= 0 || distanceMiles > 100) {
    return jsonResponse8(
      {
        error: "Enter a valid service distance."
      },
      400
    );
  }
  if (discountPercent != null && (!Number.isFinite(
    discountPercent
  ) || discountPercent < 0 || discountPercent > 100)) {
    return jsonResponse8(
      {
        error: "Discount must be between 0 and 100."
      },
      400
    );
  }
  const ownerToken = createToken();
  const ownerTokenHash = await sha2562(
    ownerToken
  );
  const verificationExpiresAt = new Date(
    Date.now() + 24 * 60 * 60 * 1e3
  ).toISOString();
  const radiusKm = milesToKm(
    distanceMiles
  );
  const insert = await env.gyan_registry.prepare(
    `
        INSERT INTO advertisement_submissions (
          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          city,
          region,
          region_code,
          country_code,
          postal_code,

          service_radius_km,

          phone,
          email,

          duration_days,

          verification_token_hash,
          verification_expires_at
        )

        VALUES (
          ?,
          ?,

          ?,
          ?,
          ?,

          ?,
          ?,

          ?,
          ?,
          ?,
          ?,
          ?,

          ?,

          ?,
          ?,

          ?,

          ?,
          ?
        )
        `
  ).bind(
    businessName,
    serviceName,
    offer || null,
    discountPercent,
    description || null,
    latitude,
    longitude,
    city || null,
    region || null,
    regionCode || null,
    countryCode || null,
    postalCode || null,
    radiusKm,
    phone,
    email,
    durationDays,
    ownerTokenHash,
    verificationExpiresAt
  ).run();
  const submissionId = Number(
    insert.meta.last_row_id
  );
  const verifyUrl = `${url.origin}/api/advertisements/verify?id=${submissionId}&token=${encodeURIComponent(
    ownerToken
  )}`;
  try {
    await sendEmail2(
      env,
      email,
      "Verify your GYAN advertisement",
      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;

            color:
              #222;
          "
        >
          <h2>
            Verify your GYAN advertisement
          </h2>

          <p>
            We received an advertisement request for:
          </p>

          <p>
            <strong>
              ${escapeHtml3(
        businessName
      )}
            </strong>
            <br>

            ${escapeHtml3(
        serviceName
      )}
          </p>

          ${offer ? `
                <p>
                  Offer:
                  <strong>
                    ${escapeHtml3(
        offer
      )}
                  </strong>
                </p>
              ` : ""}

          <p>
            Please verify your email before
            the advertisement can be reviewed.
          </p>

          <p>
            <a
              href="${verifyUrl}"
              style="
                display:
                  inline-block;

                padding:
                  10px 16px;

                background:
                  #176b42;

                color:
                  white;

                text-decoration:
                  none;

                border-radius:
                  8px;
              "
            >
              Verify Advertisement
            </a>
          </p>

          <p
            style="
              color:
                #777;

              font-size:
                12px;
            "
          >
            This verification link
            expires in 24 hours.
          </p>
        </div>
      `
    );
  } catch {
    return jsonResponse8(
      {
        submitted: true,
        emailSent: false,
        submissionId,
        error: "Submission was saved, but the verification email could not be sent."
      },
      502
    );
  }
  return jsonResponse8({
    submitted: true,
    emailSent: true,
    submissionId
  });
}
__name(createAdvertisement, "createAdvertisement");
async function verifyAdvertisement(env, url) {
  const id = Number(
    url.searchParams.get(
      "id"
    )
  );
  const token = url.searchParams.get(
    "token"
  ) ?? "";
  if (!Number.isInteger(
    id
  ) || id <= 0 || !token) {
    return new Response(
      "Invalid verification link.",
      {
        status: 400
      }
    );
  }
  const row = await env.gyan_registry.prepare(
    `
        SELECT
          id,

          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          city,
          region,
          region_code,
          country_code,
          postal_code,

          service_radius_km,

          phone,
          email,

          duration_days,

          status,

          verification_token_hash,
          verification_expires_at,

          admin_review_token_hash,
          admin_review_expires_at

        FROM advertisement_submissions

        WHERE id = ?
        `
  ).bind(
    id
  ).first();
  if (!row) {
    return new Response(
      "Advertisement submission not found.",
      {
        status: 404
      }
    );
  }
  if (row.status === "pending_review" || row.status === "approved") {
    return new Response(
      "Your email has already been verified.",
      {
        headers: {
          "content-type": "text/plain; charset=utf-8"
        }
      }
    );
  }
  if (!row.verification_token_hash || !row.verification_expires_at) {
    return new Response(
      "Verification link is no longer valid.",
      {
        status: 400
      }
    );
  }
  const verificationExpiry = Date.parse(
    row.verification_expires_at
  );
  if (!Number.isFinite(
    verificationExpiry
  ) || Date.now() > verificationExpiry) {
    return new Response(
      "Verification link has expired.",
      {
        status: 400
      }
    );
  }
  const suppliedHash = await sha2562(
    token
  );
  if (suppliedHash !== row.verification_token_hash) {
    return new Response(
      "Invalid verification link.",
      {
        status: 403
      }
    );
  }
  const adminToken = createToken();
  const adminTokenHash = await sha2562(
    adminToken
  );
  const adminReviewExpiresAt = new Date(
    Date.now() + 15 * 24 * 60 * 60 * 1e3
  ).toISOString();
  await env.gyan_registry.prepare(
    `
      UPDATE advertisement_submissions

      SET
        status =
          'pending_review',

        email_verified_at =
          CURRENT_TIMESTAMP,

        verification_token_hash =
          NULL,

        verification_expires_at =
          NULL,

        admin_review_token_hash =
          ?,

        admin_review_expires_at =
          ?,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `
  ).bind(
    adminTokenHash,
    adminReviewExpiresAt,
    id
  ).run();
  const adminReviewUrl = `${url.origin}/api/advertisements/review?id=${row.id}&token=${encodeURIComponent(
    adminToken
  )}`;
  try {
    await sendEmail2(
      env,
      "admin@gyan.cc",
      `Review GYAN advertisement: ${row.business_name}`,
      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;

            color:
              #222;
          "
        >
          <h2>
            Advertisement ready for review
          </h2>

          <p>
            <strong>
              ${escapeHtml3(
        row.business_name
      )}
            </strong>
          </p>

          <p>
            Service:
            ${escapeHtml3(
        row.service_name
      )}
          </p>

          ${row.offer_text ? `
                <p>
                  Offer:
                  ${escapeHtml3(
        row.offer_text
      )}
                </p>
              ` : ""}

          ${row.discount_percent != null ? `
                <p>
                  Discount:
                  ${row.discount_percent}%
                </p>
              ` : ""}

          <p>
            Service radius:
            ${row.service_radius_km.toFixed(
        1
      )}
            km
          </p>

          <p>
            Duration:
            ${row.duration_days}
            days
          </p>

          <p>
            Email:
            ${escapeHtml3(
        row.email
      )}
          </p>

          ${row.phone ? `
                <p>
                  Phone:
                  ${escapeHtml3(
        row.phone
      )}
                </p>
              ` : ""}

          <p>
            <a
              href="${adminReviewUrl}"
              style="
                display:
                  inline-block;

                padding:
                  10px 16px;

                background:
                  #176b42;

                color:
                  white;

                text-decoration:
                  none;

                border-radius:
                  8px;
              "
            >
              Review Advertisement
            </a>
          </p>

          <p
            style="
              color:
                #777;

              font-size:
                12px;
            "
          >
            This secure review link
            is valid for 15 days.
          </p>
        </div>
      `
    );
  } catch (error) {
    console.error(
      "Admin advertisement notification failed:",
      error
    );
  }
  return new Response(
    `
      <!doctype html>

      <html>
        <head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
          >

          <title>
            GYAN Advertisement Verified
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              24px;

            font-family:
              Arial,
              sans-serif;

            background:
              #fffdf8;

            color:
              #292720;
          "
        >
          <div
            style="
              max-width:
                480px;

              margin:
                40px auto;

              padding:
                24px;

              background:
                white;

              border:
                1px solid
                #e6e0d4;

              border-radius:
                16px;

              text-align:
                center;
            "
          >
            <div
              style="
                font-size:
                  42px;
              "
            >
              \u2705
            </div>

            <h2>
              Email verified
            </h2>

            <p>
              Your advertisement for
              <strong>
                ${escapeHtml3(
      row.business_name
    )}
              </strong>
              has been submitted for
              review.
            </p>

            <p>
              GYAN will publish it
              after approval.
            </p>

            <a
              href="/"
              style="
                display:
                  inline-block;

                margin-top:
                  12px;

                padding:
                  10px 18px;

                background:
                  #176b42;

                color:
                  white;

                border-radius:
                  8px;

                text-decoration:
                  none;
              "
            >
              Return to GYAN
            </a>
          </div>
        </body>
      </html>
    `,
    {
      headers: {
        "content-type": "text/html; charset=utf-8"
      }
    }
  );
}
__name(verifyAdvertisement, "verifyAdvertisement");
async function loadAuthorizedReview(env, id, token) {
  const row = await env.gyan_registry.prepare(
    `
        SELECT
          id,

          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          city,
          region,
          region_code,
          country_code,
          postal_code,

          service_radius_km,

          phone,
          email,

          duration_days,

          status,

          verification_token_hash,
          verification_expires_at,

          admin_review_token_hash,
          admin_review_expires_at

        FROM advertisement_submissions

        WHERE id = ?
        `
  ).bind(
    id
  ).first();
  if (!row || row.status !== "pending_review" || !row.admin_review_token_hash || !row.admin_review_expires_at) {
    return null;
  }
  const expiry = Date.parse(
    row.admin_review_expires_at
  );
  if (!Number.isFinite(
    expiry
  ) || Date.now() > expiry) {
    return null;
  }
  const suppliedHash = await sha2562(
    token
  );
  if (suppliedHash !== row.admin_review_token_hash) {
    return null;
  }
  return row;
}
__name(loadAuthorizedReview, "loadAuthorizedReview");
async function reviewAdvertisement(env, url) {
  const id = Number(
    url.searchParams.get(
      "id"
    )
  );
  const token = url.searchParams.get(
    "token"
  ) ?? "";
  if (!Number.isInteger(
    id
  ) || id <= 0 || !token) {
    return new Response(
      "Invalid review link.",
      {
        status: 400
      }
    );
  }
  const row = await loadAuthorizedReview(
    env,
    id,
    token
  );
  if (!row) {
    return new Response(
      "Review link is invalid, expired, or already used.",
      {
        status: 403
      }
    );
  }
  return new Response(
    `
      <!doctype html>

      <html>
        <head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
          >

          <title>
            Review GYAN Advertisement
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              20px;

            background:
              #fffdf8;

            font-family:
              Arial,
              sans-serif;

            color:
              #292720;
          "
        >
          <main
            style="
              max-width:
                520px;

              margin:
                20px auto;

              padding:
                20px;

              background:
                white;

              border:
                1px solid
                #e5e0d5;

              border-radius:
                16px;
            "
          >
            <h2>
              \u{1F4E3} Review Advertisement
            </h2>

            <h3>
              ${escapeHtml3(
      row.business_name
    )}
            </h3>

            <p>
              <strong>
                Service:
              </strong>

              ${escapeHtml3(
      row.service_name
    )}
            </p>

            ${row.offer_text ? `
                  <p>
                    <strong>
                      Offer:
                    </strong>

                    ${escapeHtml3(
      row.offer_text
    )}
                  </p>
                ` : ""}

            ${row.discount_percent != null ? `
                  <p>
                    <strong>
                      Discount:
                    </strong>

                    ${row.discount_percent}%
                  </p>
                ` : ""}

            ${row.description ? `
                  <p>
                    <strong>
                      Description:
                    </strong>

                    ${escapeHtml3(
      row.description
    )}
                  </p>
                ` : ""}

            <p>
              <strong>
                Service radius:
              </strong>

              ${row.service_radius_km.toFixed(
      1
    )}
              km
            </p>

            <p>
              <strong>
                Duration:
              </strong>

              ${row.duration_days}
              days
            </p>

            <p>
              <strong>
                Email:
              </strong>

              ${escapeHtml3(
      row.email
    )}
            </p>

            ${row.phone ? `
                  <p>
                    <strong>
                      Phone:
                    </strong>

                    ${escapeHtml3(
      row.phone
    )}
                  </p>
                ` : ""}

            <div
              style="
                display:
                  grid;

                grid-template-columns:
                  1fr 1fr;

                gap:
                  10px;

                margin-top:
                  20px;
              "
            >
              <form
                method="POST"
                action="/api/advertisements/review-action"
              >
                <input
                  type="hidden"
                  name="id"
                  value="${row.id}"
                >

                <input
                  type="hidden"
                  name="token"
                  value="${escapeHtml3(
      token
    )}"
                >

                <input
                  type="hidden"
                  name="action"
                  value="approve"
                >

                <button
                  type="submit"
                  style="
                    width:
                      100%;

                    padding:
                      12px;

                    border:
                      0;

                    border-radius:
                      9px;

                    background:
                      #176b42;

                    color:
                      white;

                    font-weight:
                      700;

                    cursor:
                      pointer;
                  "
                >
                  \u2713 Approve
                </button>
              </form>


              <form
                method="POST"
                action="/api/advertisements/review-action"
              >
                <input
                  type="hidden"
                  name="id"
                  value="${row.id}"
                >

                <input
                  type="hidden"
                  name="token"
                  value="${escapeHtml3(
      token
    )}"
                >

                <input
                  type="hidden"
                  name="action"
                  value="reject"
                >

                <button
                  type="submit"
                  style="
                    width:
                      100%;

                    padding:
                      12px;

                    border:
                      1px solid #d6d0c5;

                    border-radius:
                      9px;

                    background:
                      white;

                    color:
                      #7b312a;

                    font-weight:
                      700;

                    cursor:
                      pointer;
                  "
                >
                  Reject
                </button>
              </form>
            </div>
          </main>
        </body>
      </html>
    `,
    {
      headers: {
        "content-type": "text/html; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(reviewAdvertisement, "reviewAdvertisement");
async function reviewAdvertisementAction(request, env, url) {
  let formData;
  try {
    formData = await request.formData();
  } catch {
    return new Response(
      "Invalid request.",
      {
        status: 400
      }
    );
  }
  const id = Number(
    formData.get(
      "id"
    )
  );
  const token = String(
    formData.get(
      "token"
    ) ?? ""
  );
  const action = String(
    formData.get(
      "action"
    ) ?? ""
  );
  if (!Number.isInteger(
    id
  ) || id <= 0 || !token || action !== "approve" && action !== "reject") {
    return new Response(
      "Invalid review request.",
      {
        status: 400
      }
    );
  }
  const row = await loadAuthorizedReview(
    env,
    id,
    token
  );
  if (!row) {
    return new Response(
      "Review link is invalid, expired, or already used.",
      {
        status: 403
      }
    );
  }
  if (action === "reject") {
    await env.gyan_registry.prepare(
      `
        UPDATE advertisement_submissions

        SET
          status =
            'rejected',

          admin_review_token_hash =
            NULL,

          admin_review_expires_at =
            NULL,

          updated_at =
            CURRENT_TIMESTAMP

        WHERE id = ?
        `
    ).bind(
      id
    ).run();
    return reviewResultPage(
      "Advertisement rejected",
      "The advertisement was not published.",
      "\u274C"
    );
  }
  const deleteToken = createToken();
  const deleteTokenHash = await sha2562(
    deleteToken
  );
  const deleteTokenExpiresAt = new Date(
    Date.now() + 30 * 24 * 60 * 60 * 1e3
  ).toISOString();
  const promotionInsert = await env.gyan_registry.prepare(
    `
        INSERT INTO featured_promotions (
          source_type,

          title,
          description,

          icon,

          cta_label,
          target_url,

          service_code,
          shop_code,

          latitude,
          longitude,

          radius_km,

          starts_at,
          ends_at,

          priority,

          enabled,

          offer_text,
          discount_percent
        )

        VALUES (
          'gyan',

          ?,
          ?,

          '\u{1F4E3}',

          'View',
          NULL,

          NULL,
          NULL,

          ?,
          ?,

          ?,

          CURRENT_TIMESTAMP,

          datetime(
            CURRENT_TIMESTAMP,
            '+30 days'
          ),

          100,

          1,

          ?,
          ?
        )
        `
  ).bind(
    row.business_name,
    row.description || row.service_name,
    row.latitude,
    row.longitude,
    row.service_radius_km,
    row.offer_text,
    row.discount_percent
  ).run();
  const promotionId = Number(
    promotionInsert.meta.last_row_id
  );
  await env.gyan_registry.prepare(
    `
      UPDATE advertisement_submissions

      SET
        status =
          'approved',

        approved_at =
          CURRENT_TIMESTAMP,

        featured_promotion_id =
          ?,

        delete_token_hash =
          ?,

        delete_token_expires_at =
          ?,

        admin_review_token_hash =
          NULL,

        admin_review_expires_at =
          NULL,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `
  ).bind(
    promotionId,
    deleteTokenHash,
    deleteTokenExpiresAt,
    id
  ).run();
  const deleteUrl = `${url.origin}/api/advertisements/delete?id=${row.id}&token=${encodeURIComponent(
    deleteToken
  )}`;
  try {
    await sendEmail2(
      env,
      row.email,
      "Your GYAN advertisement is live",
      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;
          "
        >
          <h2>
            Your advertisement is live \u{1F389}
          </h2>

          <p>
            Your advertisement for
            <strong>
              ${escapeHtml3(
        row.business_name
      )}
            </strong>
            has been approved.
          </p>

          <p>
            It may now appear to GYAN users
            within your selected service area.
          </p>

          <div
            style="
              display:
                flex;

              gap:
                10px;

              margin-top:
                16px;

              flex-wrap:
                wrap;
            "
          >
            <a
              href="${url.origin}/"
              style="
                padding:
                  10px 16px;

                background:
                  #176b42;

                color:
                  white;

                text-decoration:
                  none;

                border-radius:
                  8px;
              "
            >
              Open GYAN
            </a>

            <a
              href="${deleteUrl}"
              style="
                padding:
                  10px 16px;

                background:
                  white;

                color:
                  #8a3128;

                text-decoration:
                  none;

                border:
                  1px solid #d8c9c5;

                border-radius:
                  8px;
              "
            >
              Delete Request
            </a>
          </div>

          <p
            style="
              margin-top:
                16px;

              color:
                #777;

              font-size:
                12px;
            "
          >
            Your free advertisement expires
            automatically after 30 days.
          </p>
        </div>
      `
    );
  } catch (error) {
    console.error(
      "Advertiser approval email failed:",
      error
    );
  }
  return reviewResultPage(
    "Advertisement approved",
    "The advertisement is now eligible to appear in Featured.",
    "\u2705"
  );
}
__name(reviewAdvertisementAction, "reviewAdvertisementAction");
async function loadAuthorizedDelete(env, id, token) {
  const row = await env.gyan_registry.prepare(
    `
        SELECT
          id,

          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          city,
          region,
          region_code,
          country_code,
          postal_code,

          service_radius_km,

          phone,
          email,

          duration_days,

          status,

          verification_token_hash,
          verification_expires_at,

          admin_review_token_hash,
          admin_review_expires_at,

          featured_promotion_id,
          delete_token_hash,
          delete_token_expires_at,
          deleted_at

        FROM advertisement_submissions

        WHERE id = ?
        `
  ).bind(
    id
  ).first();
  if (!row || row.status !== "approved" || row.deleted_at || !row.delete_token_hash || !row.delete_token_expires_at) {
    return null;
  }
  const expiry = Date.parse(
    row.delete_token_expires_at
  );
  if (!Number.isFinite(
    expiry
  ) || Date.now() > expiry) {
    return null;
  }
  const suppliedHash = await sha2562(
    token
  );
  if (suppliedHash !== row.delete_token_hash) {
    return null;
  }
  return row;
}
__name(loadAuthorizedDelete, "loadAuthorizedDelete");
async function deleteAdvertisementPage(env, url) {
  const id = Number(
    url.searchParams.get(
      "id"
    )
  );
  const token = url.searchParams.get(
    "token"
  ) ?? "";
  if (!Number.isInteger(
    id
  ) || id <= 0 || !token) {
    return new Response(
      "Invalid delete link.",
      {
        status: 400
      }
    );
  }
  const row = await loadAuthorizedDelete(
    env,
    id,
    token
  );
  if (!row) {
    return new Response(
      "Delete link is invalid, expired, or already used.",
      {
        status: 403
      }
    );
  }
  return new Response(
    `
      <!doctype html>

      <html>
        <head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
          >

          <title>
            Delete GYAN Advertisement
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              24px;

            background:
              #fffdf8;

            font-family:
              Arial,
              sans-serif;

            color:
              #292720;
          "
        >
          <main
            style="
              max-width:
                480px;

              margin:
                40px auto;

              padding:
                24px;

              background:
                white;

              border:
                1px solid
                #e6e0d4;

              border-radius:
                16px;
            "
          >
            <div
              style="
                font-size:
                  36px;
              "
            >
              \u{1F5D1}\uFE0F
            </div>

            <h2>
              Delete Advertisement?
            </h2>

            <p>
              <strong>
                ${escapeHtml3(
      row.business_name
    )}
              </strong>
            </p>

            <p>
              Service:
              ${escapeHtml3(
      row.service_name
    )}
            </p>

            <p>
              This will immediately remove
              the advertisement from GYAN Featured.
            </p>

            <div
              style="
                display:
                  grid;

                grid-template-columns:
                  1fr 1fr;

                gap:
                  10px;

                margin-top:
                  20px;
              "
            >
              <a
                href="/"
                style="
                  padding:
                    12px;

                  text-align:
                    center;

                  border:
                    1px solid #d6d0c5;

                  border-radius:
                    9px;

                  color:
                    #333;

                  text-decoration:
                    none;
                "
              >
                Cancel
              </a>

              <form
                method="POST"
                action="/api/advertisements/delete"
              >
                <input
                  type="hidden"
                  name="id"
                  value="${row.id}"
                >

                <input
                  type="hidden"
                  name="token"
                  value="${escapeHtml3(
      token
    )}"
                >

                <button
                  type="submit"
                  style="
                    width:
                      100%;

                    padding:
                      12px;

                    border:
                      0;

                    border-radius:
                      9px;

                    background:
                      #9a382f;

                    color:
                      white;

                    font-weight:
                      700;

                    cursor:
                      pointer;
                  "
                >
                  Delete Advertisement
                </button>
              </form>
            </div>
          </main>
        </body>
      </html>
    `,
    {
      headers: {
        "content-type": "text/html; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(deleteAdvertisementPage, "deleteAdvertisementPage");
async function deleteAdvertisementAction(request, env) {
  let formData;
  try {
    formData = await request.formData();
  } catch {
    return new Response(
      "Invalid request.",
      {
        status: 400
      }
    );
  }
  const id = Number(
    formData.get(
      "id"
    )
  );
  const token = String(
    formData.get(
      "token"
    ) ?? ""
  );
  if (!Number.isInteger(
    id
  ) || id <= 0 || !token) {
    return new Response(
      "Invalid delete request.",
      {
        status: 400
      }
    );
  }
  const row = await loadAuthorizedDelete(
    env,
    id,
    token
  );
  if (!row) {
    return new Response(
      "Delete link is invalid, expired, or already used.",
      {
        status: 403
      }
    );
  }
  if (row.featured_promotion_id != null) {
    await env.gyan_registry.prepare(
      `
        UPDATE featured_promotions

        SET
          enabled = 0

        WHERE id = ?
        `
    ).bind(
      row.featured_promotion_id
    ).run();
  }
  await env.gyan_registry.prepare(
    `
      UPDATE advertisement_submissions

      SET
        deleted_at =
          CURRENT_TIMESTAMP,

        delete_token_hash =
          NULL,

        delete_token_expires_at =
          NULL,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `
  ).bind(
    id
  ).run();
  return reviewResultPage(
    "Advertisement deleted",
    "Your advertisement has been removed from GYAN Featured.",
    "\u{1F5D1}\uFE0F"
  );
}
__name(deleteAdvertisementAction, "deleteAdvertisementAction");
function reviewResultPage(title, message, icon) {
  return new Response(
    `
      <!doctype html>

      <html>
        <head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
          >

          <title>
            ${escapeHtml3(
      title
    )}
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              24px;

            background:
              #fffdf8;

            font-family:
              Arial,
              sans-serif;

            color:
              #292720;
          "
        >
          <main
            style="
              max-width:
                480px;

              margin:
                40px auto;

              padding:
                24px;

              background:
                white;

              border:
                1px solid
                #e6e0d4;

              border-radius:
                16px;

              text-align:
                center;
            "
          >
            <div
              style="
                font-size:
                  42px;
              "
            >
              ${icon}
            </div>

            <h2>
              ${escapeHtml3(
      title
    )}
            </h2>

            <p>
              ${escapeHtml3(
      message
    )}
            </p>

            <a
              href="/"
              style="
                display:
                  inline-block;

                margin-top:
                  12px;

                padding:
                  10px 18px;

                background:
                  #176b42;

                color:
                  white;

                border-radius:
                  8px;

                text-decoration:
                  none;
              "
            >
              Open GYAN
            </a>
          </main>
        </body>
      </html>
    `,
    {
      headers: {
        "content-type": "text/html; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(reviewResultPage, "reviewResultPage");
async function handleAdvertisementRoute(request, env, url) {
  if (request.method === "POST" && url.pathname === "/api/advertisements") {
    return createAdvertisement(
      request,
      env,
      url
    );
  }
  if (request.method === "GET" && url.pathname === "/api/advertisements/verify") {
    return verifyAdvertisement(
      env,
      url
    );
  }
  if (request.method === "GET" && url.pathname === "/api/advertisements/review") {
    return reviewAdvertisement(
      env,
      url
    );
  }
  if (request.method === "POST" && url.pathname === "/api/advertisements/review-action") {
    return reviewAdvertisementAction(
      request,
      env,
      url
    );
  }
  if (request.method === "GET" && url.pathname === "/api/advertisements/delete") {
    return deleteAdvertisementPage(
      env,
      url
    );
  }
  if (request.method === "POST" && url.pathname === "/api/advertisements/delete") {
    return deleteAdvertisementAction(
      request,
      env
    );
  }
  return null;
}
__name(handleAdvertisementRoute, "handleAdvertisementRoute");

// worker/localServiceRequests.ts
init_modules_watch_stub();
function jsonResponse9(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse9, "jsonResponse");
function cleanText2(value) {
  return (value ?? "").trim();
}
__name(cleanText2, "cleanText");
function isValidEmail2(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    email
  );
}
__name(isValidEmail2, "isValidEmail");
function milesToKm2(miles) {
  return miles * 1.609344;
}
__name(milesToKm2, "milesToKm");
function toRadians2(value) {
  return value * Math.PI / 180;
}
__name(toRadians2, "toRadians");
function distanceKm(firstLatitude, firstLongitude, secondLatitude, secondLongitude) {
  const earthRadiusKm = 6371;
  const latitudeDifference = toRadians2(
    secondLatitude - firstLatitude
  );
  const longitudeDifference = toRadians2(
    secondLongitude - firstLongitude
  );
  const firstLatitudeRadians = toRadians2(
    firstLatitude
  );
  const secondLatitudeRadians = toRadians2(
    secondLatitude
  );
  const value = Math.sin(
    latitudeDifference / 2
  ) ** 2 + Math.cos(
    firstLatitudeRadians
  ) * Math.cos(
    secondLatitudeRadians
  ) * Math.sin(
    longitudeDifference / 2
  ) ** 2;
  return earthRadiusKm * 2 * Math.atan2(
    Math.sqrt(value),
    Math.sqrt(
      1 - value
    )
  );
}
__name(distanceKm, "distanceKm");
function bytesToHex3(bytes) {
  return Array.from(bytes).map(
    (value) => value.toString(16).padStart(
      2,
      "0"
    )
  ).join("");
}
__name(bytesToHex3, "bytesToHex");
function createToken2() {
  const bytes = new Uint8Array(
    32
  );
  crypto.getRandomValues(
    bytes
  );
  return bytesToHex3(
    bytes
  );
}
__name(createToken2, "createToken");
async function sha2563(value) {
  const encoded = new TextEncoder().encode(value);
  const digest = await crypto.subtle.digest(
    "SHA-256",
    encoded
  );
  return bytesToHex3(
    new Uint8Array(
      digest
    )
  );
}
__name(sha2563, "sha256");
function escapeHtml4(value) {
  return value.replaceAll(
    "&",
    "&amp;"
  ).replaceAll(
    "<",
    "&lt;"
  ).replaceAll(
    ">",
    "&gt;"
  ).replaceAll(
    '"',
    "&quot;"
  ).replaceAll(
    "'",
    "&#039;"
  );
}
__name(escapeHtml4, "escapeHtml");
async function sendEmail3(env, to, subject, html) {
  const response = await fetch(
    "https://api.resend.com/emails",
    {
      method: "POST",
      headers: {
        authorization: `Bearer ${env.RESEND_API_KEY}`,
        "content-type": "application/json"
      },
      body: JSON.stringify({
        from: "GYAN <admin@gyan.cc>",
        to: [
          to
        ],
        subject,
        html
      })
    }
  );
  if (!response.ok) {
    const message = await response.text();
    console.error(
      "Local service request email failed:",
      message
    );
    throw new Error(
      "Email could not be sent."
    );
  }
}
__name(sendEmail3, "sendEmail");
async function createLocalServiceRequest(request, env, url) {
  let body;
  try {
    body = await request.json();
  } catch {
    return jsonResponse9(
      {
        error: "Invalid request."
      },
      400
    );
  }
  const service = cleanText2(
    body.service
  );
  const details = cleanText2(
    body.details
  );
  const email = cleanText2(
    body.email
  ).toLowerCase();
  const phone = cleanText2(
    body.phone
  );
  const preferredTime = cleanText2(
    body.preferredTime
  );
  const latitude = Number(
    body.latitude
  );
  const longitude = Number(
    body.longitude
  );
  const distanceMiles = Number(
    body.distanceMiles
  );
  if (!service || !email) {
    return jsonResponse9(
      {
        error: "Service and email are required."
      },
      400
    );
  }
  if (!isValidEmail2(
    email
  )) {
    return jsonResponse9(
      {
        error: "Enter a valid email address."
      },
      400
    );
  }
  if (!Number.isFinite(
    latitude
  ) || latitude < -90 || latitude > 90 || !Number.isFinite(
    longitude
  ) || longitude < -180 || longitude > 180) {
    return jsonResponse9(
      {
        error: "A valid location is required."
      },
      400
    );
  }
  if (!Number.isFinite(
    distanceMiles
  ) || distanceMiles <= 0 || distanceMiles > 100) {
    return jsonResponse9(
      {
        error: "Enter a valid search distance."
      },
      400
    );
  }
  const verificationToken = createToken2();
  const verificationTokenHash = await sha2563(
    verificationToken
  );
  const verificationExpiresAt = new Date(
    Date.now() + 24 * 60 * 60 * 1e3
  ).toISOString();
  const searchRadiusKm = milesToKm2(
    distanceMiles
  );
  const insert = await env.gyan_registry.prepare(
    `
        INSERT INTO local_service_requests (
          service_name,
          details,

          latitude,
          longitude,

          search_radius_km,

          email,
          phone,

          preferred_time,

          verification_token_hash,
          verification_expires_at
        )

        VALUES (
          ?,
          ?,

          ?,
          ?,

          ?,

          ?,
          ?,

          ?,

          ?,
          ?
        )
        `
  ).bind(
    service,
    details || null,
    latitude,
    longitude,
    searchRadiusKm,
    email,
    phone || null,
    preferredTime || null,
    verificationTokenHash,
    verificationExpiresAt
  ).run();
  const requestId = Number(
    insert.meta.last_row_id
  );
  const verifyUrl = `${url.origin}/api/local-service-requests/verify?id=${requestId}&token=${encodeURIComponent(
    verificationToken
  )}`;
  try {
    await sendEmail3(
      env,
      email,
      "Verify your GYAN service request",
      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;

            color:
              #222;
          "
        >
          <h2>
            Verify your service request
          </h2>

          <p>
            You requested:
          </p>

          <p>
            <strong>
              ${escapeHtml4(
        service
      )}
            </strong>
          </p>

          ${details ? `
                <p>
                  ${escapeHtml4(
        details
      )}
                </p>
              ` : ""}

          <p>
            Please verify your email so
            GYAN can route your request.
          </p>

          <p>
            <a
              href="${verifyUrl}"
              style="
                display:
                  inline-block;

                padding:
                  10px 16px;

                background:
                  #176b42;

                color:
                  white;

                text-decoration:
                  none;

                border-radius:
                  8px;
              "
            >
              Verify Request
            </a>
          </p>

          <p
            style="
              color:
                #777;

              font-size:
                12px;
            "
          >
            This link expires in 24 hours.
          </p>
        </div>
      `
    );
  } catch {
    return jsonResponse9(
      {
        submitted: true,
        emailSent: false,
        requestId,
        error: "Request was saved, but verification email could not be sent."
      },
      502
    );
  }
  return jsonResponse9({
    submitted: true,
    emailSent: true,
    requestId
  });
}
__name(createLocalServiceRequest, "createLocalServiceRequest");
async function findNearestShop(env, latitude, longitude, searchRadiusKm) {
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          email_address,
          latitude,
          longitude

        FROM shops

        WHERE
          status =
            'active'

          AND code !=
            'SUPP'

          AND latitude
            IS NOT NULL

          AND longitude
            IS NOT NULL
        `
  ).all();
  let nearest = null;
  for (const shop of result.results ?? []) {
    const distance = distanceKm(
      latitude,
      longitude,
      shop.latitude,
      shop.longitude
    );
    if (distance > searchRadiusKm) {
      continue;
    }
    if (!nearest || distance < nearest.distanceKm) {
      nearest = {
        shop,
        distanceKm: distance
      };
    }
  }
  return nearest;
}
__name(findNearestShop, "findNearestShop");
async function loadRequest2(env, id) {
  return env.gyan_registry.prepare(
    `
      SELECT
        id,
        service_name,
        details,
        latitude,
        longitude,
        search_radius_km,
        email,
        phone,
        preferred_time,
        status,
        verification_token_hash,
        verification_expires_at,
        assigned_shop_code

      FROM local_service_requests

      WHERE id = ?
      `
  ).bind(
    id
  ).first();
}
__name(loadRequest2, "loadRequest");
async function verifyLocalServiceRequest(env, url) {
  const id = Number(
    url.searchParams.get(
      "id"
    )
  );
  const token = url.searchParams.get(
    "token"
  ) ?? "";
  if (!Number.isInteger(
    id
  ) || id <= 0 || !token) {
    return new Response(
      "Invalid verification link.",
      {
        status: 400
      }
    );
  }
  const row = await loadRequest2(
    env,
    id
  );
  if (!row) {
    return new Response(
      "Service request not found.",
      {
        status: 404
      }
    );
  }
  if (row.status !== "pending_email_verification") {
    return new Response(
      "This request has already been verified.",
      {
        headers: {
          "content-type": "text/plain; charset=utf-8"
        }
      }
    );
  }
  if (!row.verification_token_hash || !row.verification_expires_at) {
    return new Response(
      "Verification link is no longer valid.",
      {
        status: 400
      }
    );
  }
  const expiry = Date.parse(
    row.verification_expires_at
  );
  if (!Number.isFinite(
    expiry
  ) || Date.now() > expiry) {
    return new Response(
      "Verification link has expired.",
      {
        status: 400
      }
    );
  }
  const suppliedHash = await sha2563(
    token
  );
  if (suppliedHash !== row.verification_token_hash) {
    return new Response(
      "Invalid verification link.",
      {
        status: 403
      }
    );
  }
  const nearest = await findNearestShop(
    env,
    row.latitude,
    row.longitude,
    row.search_radius_km
  );
  const assignedShopCode = nearest ? nearest.shop.code : "SUPP";
  await env.gyan_registry.prepare(
    `
      UPDATE local_service_requests

      SET
        status =
          'active',

        email_verified_at =
          CURRENT_TIMESTAMP,

        verification_token_hash =
          NULL,

        verification_expires_at =
          NULL,

        assigned_shop_code =
          ?,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `
  ).bind(
    assignedShopCode,
    id
  ).run();
  const destinationEmail = nearest?.shop.email_address || "admin@gyan.cc";
  const destinationName = nearest?.shop.name || "GYAN Support";
  try {
    await sendEmail3(
      env,
      destinationEmail,
      `New GYAN service request: ${row.service_name}`,
      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;

            color:
              #222;
          "
        >
          <h2>
            New service request
          </h2>

          <p>
            Assigned to:
            <strong>
              ${escapeHtml4(
        destinationName
      )}
            </strong>
          </p>

          <p>
            <strong>
              Service:
            </strong>

            ${escapeHtml4(
        row.service_name
      )}
          </p>

          ${row.details ? `
                <p>
                  <strong>
                    Details:
                  </strong>

                  ${escapeHtml4(
        row.details
      )}
                </p>
              ` : ""}

          ${row.preferred_time ? `
                <p>
                  <strong>
                    Preferred time:
                  </strong>

                  ${escapeHtml4(
        row.preferred_time
      )}
                </p>
              ` : ""}

          <p>
            <strong>
              Customer email:
            </strong>

            ${escapeHtml4(
        row.email
      )}
          </p>

          ${row.phone ? `
                <p>
                  <strong>
                    Phone:
                  </strong>

                  ${escapeHtml4(
        row.phone
      )}
                </p>
              ` : ""}

          ${nearest ? `
                <p>
                  Approximate distance:
                  ${nearest.distanceKm.toFixed(
        1
      )}
                  km
                </p>
              ` : `
                <p>
                  No participating GYAN shop
                  was found within the requested
                  search radius.
                </p>
              `}
        </div>
      `
    );
  } catch (error) {
    console.error(
      "Provider notification failed:",
      error
    );
  }
  return new Response(
    `
      <!doctype html>

      <html>
        <head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
          >

          <title>
            GYAN Request Verified
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              24px;

            background:
              #fffdf8;

            font-family:
              Arial,
              sans-serif;

            color:
              #292720;
          "
        >
          <main
            style="
              max-width:
                480px;

              margin:
                40px auto;

              padding:
                24px;

              background:
                white;

              border:
                1px solid
                #e6e0d4;

              border-radius:
                16px;

              text-align:
                center;
            "
          >
            <div
              style="
                font-size:
                  42px;
              "
            >
              \u2705
            </div>

            <h2>
              Request verified
            </h2>

            <p>
              Your request for
              <strong>
                ${escapeHtml4(
      row.service_name
    )}
              </strong>
              has been received.
            </p>

            <p>
              ${nearest ? `It has been routed to ${escapeHtml4(
      nearest.shop.name
    )}.` : "GYAN Support will help route your request."}
            </p>

            <a
              href="/"
              style="
                display:
                  inline-block;

                margin-top:
                  12px;

                padding:
                  10px 18px;

                background:
                  #176b42;

                color:
                  white;

                border-radius:
                  8px;

                text-decoration:
                  none;
              "
            >
              Return to GYAN
            </a>
          </main>
        </body>
      </html>
    `,
    {
      headers: {
        "content-type": "text/html; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(verifyLocalServiceRequest, "verifyLocalServiceRequest");
async function handleLocalServiceRequestRoute(request, env, url) {
  if (request.method === "POST" && url.pathname === "/api/local-service-requests") {
    return createLocalServiceRequest(
      request,
      env,
      url
    );
  }
  if (request.method === "GET" && url.pathname === "/api/local-service-requests/verify") {
    return verifyLocalServiceRequest(
      env,
      url
    );
  }
  return null;
}
__name(handleLocalServiceRequestRoute, "handleLocalServiceRequestRoute");

// worker/auth.ts
init_modules_watch_stub();
var MAGIC_LINK_MINUTES = 15;
var SESSION_DAYS = 30;
var SESSION_COOKIE = "gyan_session";
function jsonResponse10(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse10, "jsonResponse");
function normalizeEmail4(value) {
  return String(
    value ?? ""
  ).trim().toLowerCase();
}
__name(normalizeEmail4, "normalizeEmail");
function validEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    email
  );
}
__name(validEmail, "validEmail");
function bytesToHex4(bytes) {
  return Array.from(
    bytes
  ).map(
    (value) => value.toString(16).padStart(2, "0")
  ).join("");
}
__name(bytesToHex4, "bytesToHex");
function createToken3() {
  const bytes = new Uint8Array(32);
  crypto.getRandomValues(
    bytes
  );
  return bytesToHex4(
    bytes
  );
}
__name(createToken3, "createToken");
async function sha2564(value) {
  const encoded = new TextEncoder().encode(value);
  const digest = await crypto.subtle.digest(
    "SHA-256",
    encoded
  );
  return bytesToHex4(
    new Uint8Array(
      digest
    )
  );
}
__name(sha2564, "sha256");
function escapeHtml5(value) {
  return value.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;").replaceAll("'", "&#039;");
}
__name(escapeHtml5, "escapeHtml");
function cookieValue(request, name) {
  const cookie = request.headers.get(
    "cookie"
  );
  if (!cookie) {
    return null;
  }
  for (const item of cookie.split(";")) {
    const [
      key,
      ...rest
    ] = item.trim().split("=");
    if (key === name) {
      return decodeURIComponent(
        rest.join("=")
      );
    }
  }
  return null;
}
__name(cookieValue, "cookieValue");
function sessionCookie(token, secure) {
  const maxAge = SESSION_DAYS * 24 * 60 * 60;
  const parts = [
    `${SESSION_COOKIE}=${encodeURIComponent(
      token
    )}`,
    "Path=/",
    `Max-Age=${maxAge}`,
    "HttpOnly",
    "SameSite=Lax"
  ];
  if (secure) {
    parts.push(
      "Secure"
    );
  }
  return parts.join(
    "; "
  );
}
__name(sessionCookie, "sessionCookie");
function clearSessionCookie(secure) {
  const parts = [
    `${SESSION_COOKIE}=`,
    "Path=/",
    "Max-Age=0",
    "HttpOnly",
    "SameSite=Lax"
  ];
  if (secure) {
    parts.push(
      "Secure"
    );
  }
  return parts.join(
    "; "
  );
}
__name(clearSessionCookie, "clearSessionCookie");
async function sendMagicLinkEmail(env, email, link) {
  if (!env.RESEND_API_KEY) {
    throw new Error(
      "Email service is not configured."
    );
  }
  const response = await fetch(
    "https://api.resend.com/emails",
    {
      method: "POST",
      headers: {
        authorization: `Bearer ${env.RESEND_API_KEY}`,
        "content-type": "application/json"
      },
      body: JSON.stringify({
        from: "GYAN <admin@gyan.cc>",
        to: [email],
        subject: "Sign in to GYAN",
        html: `
              <div style="font-family:Arial,sans-serif;max-width:520px;margin:auto;color:#102a56;">
                <h2 style="margin-bottom:8px;">Sign in to GYAN</h2>
                <p style="line-height:1.5;">
                  Use the button below to sign in. This link expires in ${MAGIC_LINK_MINUTES} minutes
                  and can be used only once.
                </p>

                <p style="margin:24px 0;">
                  <a
                    href="${escapeHtml5(link)}"
                    style="display:inline-block;padding:11px 18px;border-radius:9px;background:#1565c0;color:#fff;text-decoration:none;font-weight:700;"
                  >
                    Sign in to GYAN
                  </a>
                </p>

                <p style="font-size:12px;color:#64748b;line-height:1.5;">
                  If you did not request this email, you can ignore it.
                </p>
              </div>
              `
      })
    }
  );
  if (!response.ok) {
    const message = await response.text();
    console.error(
      "Magic-link email failed:",
      message
    );
    throw new Error(
      "Sign-in email could not be sent."
    );
  }
}
__name(sendMagicLinkEmail, "sendMagicLinkEmail");
function networkRegionCode(region, countryCode) {
  const key = region.trim().toLowerCase();
  const country = countryCode.trim().toUpperCase();
  const us = {
    california: "CA",
    texas: "TX",
    florida: "FL",
    "new york": "NY",
    washington: "WA",
    illinois: "IL",
    pennsylvania: "PA",
    ohio: "OH",
    georgia: "GA",
    "north carolina": "NC",
    "new jersey": "NJ",
    virginia: "VA",
    massachusetts: "MA",
    arizona: "AZ",
    michigan: "MI",
    maryland: "MD",
    colorado: "CO",
    minnesota: "MN",
    wisconsin: "WI",
    oregon: "OR",
    nevada: "NV",
    utah: "UT",
    "district of columbia": "DC"
  };
  const india = {
    "andhra pradesh": "AP",
    "arunachal pradesh": "AR",
    assam: "AS",
    bihar: "BR",
    chhattisgarh: "CG",
    goa: "GA",
    gujarat: "GJ",
    haryana: "HR",
    "himachal pradesh": "HP",
    jharkhand: "JH",
    karnataka: "KA",
    kerala: "KL",
    "madhya pradesh": "MP",
    maharashtra: "MH",
    manipur: "MN",
    meghalaya: "ML",
    mizoram: "MZ",
    nagaland: "NL",
    odisha: "OD",
    punjab: "PB",
    rajasthan: "RJ",
    sikkim: "SK",
    "tamil nadu": "TN",
    telangana: "TS",
    tripura: "TR",
    "uttar pradesh": "UP",
    uttarakhand: "UK",
    "west bengal": "WB",
    delhi: "DL",
    chandigarh: "CH",
    puducherry: "PY",
    "jammu and kashmir": "JK",
    ladakh: "LA"
  };
  if (country === "US") {
    return us[key] ?? "";
  }
  if (country === "IN") {
    return india[key] ?? "";
  }
  return "";
}
__name(networkRegionCode, "networkRegionCode");
function getNetworkLocation(request) {
  const cf = request.cf;
  const city = String(
    cf?.city ?? ""
  ).trim();
  const region = String(
    cf?.region ?? ""
  ).trim();
  const countryCode = String(
    cf?.country ?? ""
  ).trim().toUpperCase();
  const rawRegionCode = String(
    cf?.regionCode ?? ""
  ).trim().toUpperCase();
  const regionCode = rawRegionCode || networkRegionCode(
    region,
    countryCode
  );
  const postalCode = String(
    cf?.postalCode ?? ""
  ).trim();
  return {
    city,
    region,
    regionCode,
    countryCode,
    postalCode
  };
}
__name(getNetworkLocation, "getNetworkLocation");
async function currentUser(request, env) {
  const sessionToken = cookieValue(
    request,
    SESSION_COOKIE
  );
  if (!sessionToken) {
    return null;
  }
  const tokenHash = await sha2564(
    sessionToken
  );
  const row = await env.gyan_registry.prepare(
    `
        SELECT
          users.id,
          users.email

        FROM user_sessions

        INNER JOIN users
          ON users.id =
             user_sessions.user_id

        WHERE
          user_sessions.token_hash = ?
          AND user_sessions.expires_at >
              CURRENT_TIMESTAMP

        LIMIT 1
        `
  ).bind(
    tokenHash
  ).first();
  if (row) {
    await env.gyan_registry.prepare(
      `
        UPDATE user_sessions
        SET last_seen_at =
          CURRENT_TIMESTAMP
        WHERE token_hash = ?
        `
    ).bind(
      tokenHash
    ).run();
  }
  return row ?? null;
}
__name(currentUser, "currentUser");
async function handlePublicAuthRoute(request, env, url) {
  if (request.method === "GET" && url.pathname === "/api/auth/me") {
    const user = await currentUser(
      request,
      env
    );
    return jsonResponse10({
      authenticated: Boolean(user),
      user: user ? {
        id: user.id,
        email: user.email
      } : null
    });
  }
  if (request.method === "POST" && url.pathname === "/api/auth/magic-link") {
    let body;
    try {
      body = await request.json();
    } catch {
      return jsonResponse10(
        {
          error: "Invalid request."
        },
        400
      );
    }
    const email = normalizeEmail4(
      body.email
    );
    if (!validEmail(email)) {
      return jsonResponse10(
        {
          error: "Enter a valid email address."
        },
        400
      );
    }
    const recent = await env.gyan_registry.prepare(
      `
          SELECT id
          FROM auth_magic_links
          WHERE
            email = ?
            AND used_at IS NULL
            AND created_at >
              datetime(
                'now',
                '-60 seconds'
              )
          LIMIT 1
          `
    ).bind(email).first();
    if (recent) {
      return jsonResponse10({
        sent: true
      });
    }
    const token = createToken3();
    const tokenHash = await sha2564(
      token
    );
    await env.gyan_registry.prepare(
      `
        INSERT INTO auth_magic_links (
          email,
          token_hash,
          expires_at
        )
        VALUES (
          ?,
          ?,
          datetime(
            'now',
            '+${MAGIC_LINK_MINUTES} minutes'
          )
        )
        `
    ).bind(
      email,
      tokenHash
    ).run();
    const verifyUrl = new URL(
      "/api/auth/verify",
      url.origin
    );
    verifyUrl.searchParams.set(
      "token",
      token
    );
    try {
      await sendMagicLinkEmail(
        env,
        email,
        verifyUrl.toString()
      );
    } catch (error) {
      await env.gyan_registry.prepare(
        `
          DELETE FROM auth_magic_links
          WHERE token_hash = ?
          `
      ).bind(
        tokenHash
      ).run();
      return jsonResponse10(
        {
          error: error instanceof Error ? error.message : "Sign-in email could not be sent."
        },
        500
      );
    }
    return jsonResponse10({
      sent: true
    });
  }
  if (request.method === "GET" && url.pathname === "/api/auth/verify") {
    const token = url.searchParams.get(
      "token"
    ) ?? "";
    if (!token) {
      return Response.redirect(
        new URL(
          "/?auth=invalid",
          url.origin
        ).toString(),
        302
      );
    }
    const tokenHash = await sha2564(
      token
    );
    const magic = await env.gyan_registry.prepare(
      `
          SELECT
            id,
            email

          FROM auth_magic_links

          WHERE
            token_hash = ?
            AND used_at IS NULL
            AND expires_at >
                CURRENT_TIMESTAMP

          LIMIT 1
          `
    ).bind(
      tokenHash
    ).first();
    if (!magic) {
      return Response.redirect(
        new URL(
          "/?auth=invalid",
          url.origin
        ).toString(),
        302
      );
    }
    const networkLocation = getNetworkLocation(
      request
    );
    await env.gyan_registry.prepare(
      `
        INSERT INTO users (
          email,
          last_login_at,

          last_city,
          last_region,
          last_region_code,
          last_country_code,
          last_postal_code,
          last_location_at
        )
        VALUES (
          ?,
          CURRENT_TIMESTAMP,

          ?,
          ?,
          ?,
          ?,
          ?,
          CURRENT_TIMESTAMP
        )

        ON CONFLICT(email)
        DO UPDATE SET
          updated_at =
            CURRENT_TIMESTAMP,

          last_login_at =
            CURRENT_TIMESTAMP,

          last_city =
            CASE
              WHEN excluded.last_city != ''
                THEN excluded.last_city
              ELSE users.last_city
            END,

          last_region =
            CASE
              WHEN excluded.last_region != ''
                THEN excluded.last_region
              ELSE users.last_region
            END,

          last_region_code =
            CASE
              WHEN excluded.last_region_code != ''
                THEN excluded.last_region_code
              ELSE users.last_region_code
            END,

          last_country_code =
            CASE
              WHEN excluded.last_country_code != ''
                THEN excluded.last_country_code
              ELSE users.last_country_code
            END,

          last_postal_code =
            CASE
              WHEN excluded.last_postal_code != ''
                THEN excluded.last_postal_code
              ELSE users.last_postal_code
            END,

          last_location_at =
            CASE
              WHEN excluded.last_city != ''
                OR excluded.last_region != ''
                OR excluded.last_country_code != ''
                THEN CURRENT_TIMESTAMP
              ELSE users.last_location_at
            END
        `
    ).bind(
      magic.email,
      networkLocation.city,
      networkLocation.region,
      networkLocation.regionCode,
      networkLocation.countryCode,
      networkLocation.postalCode
    ).run();
    const user = await env.gyan_registry.prepare(
      `
          SELECT
            id,
            email
          FROM users
          WHERE email = ?
          LIMIT 1
          `
    ).bind(
      magic.email
    ).first();
    if (!user) {
      return Response.redirect(
        new URL(
          "/?auth=error",
          url.origin
        ).toString(),
        302
      );
    }
    const sessionToken = createToken3();
    const sessionHash = await sha2564(
      sessionToken
    );
    await env.gyan_registry.batch([
      env.gyan_registry.prepare(
        `
          UPDATE auth_magic_links
          SET used_at =
            CURRENT_TIMESTAMP
          WHERE id = ?
          `
      ).bind(
        magic.id
      ),
      env.gyan_registry.prepare(
        `
          INSERT INTO user_sessions (
            user_id,
            token_hash,
            expires_at
          )
          VALUES (
            ?,
            ?,
            datetime(
              'now',
              '+${SESSION_DAYS} days'
            )
          )
          `
      ).bind(
        user.id,
        sessionHash
      )
    ]);
    const redirectUrl = new URL(
      "/?auth=success",
      url.origin
    );
    return new Response(
      null,
      {
        status: 302,
        headers: {
          location: redirectUrl.toString(),
          "set-cookie": sessionCookie(
            sessionToken,
            url.protocol === "https:"
          ),
          "cache-control": "no-store"
        }
      }
    );
  }
  if (request.method === "POST" && url.pathname === "/api/auth/logout") {
    const sessionToken = cookieValue(
      request,
      SESSION_COOKIE
    );
    if (sessionToken) {
      const tokenHash = await sha2564(
        sessionToken
      );
      await env.gyan_registry.prepare(
        `
          DELETE FROM user_sessions
          WHERE token_hash = ?
          `
      ).bind(
        tokenHash
      ).run();
    }
    return new Response(
      JSON.stringify({
        loggedOut: true
      }),
      {
        status: 200,
        headers: {
          "content-type": "application/json; charset=utf-8",
          "cache-control": "no-store",
          "set-cookie": clearSessionCookie(
            url.protocol === "https:"
          )
        }
      }
    );
  }
  return null;
}
__name(handlePublicAuthRoute, "handlePublicAuthRoute");

// worker/analytics.ts
init_modules_watch_stub();
function jsonResponse11(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse11, "jsonResponse");
function cleanString(value, fallback = "") {
  return typeof value === "string" ? value.trim() : fallback;
}
__name(cleanString, "cleanString");
function normalizePeriod(value) {
  switch (value) {
    case "today":
    case "7d":
    case "30d":
    case "1y":
      return value;
    default:
      return "today";
  }
}
__name(normalizePeriod, "normalizePeriod");
function periodDays(period) {
  switch (period) {
    case "today":
      return 1;
    case "7d":
      return 7;
    case "30d":
      return 30;
    case "1y":
      return 365;
  }
}
__name(periodDays, "periodDays");
function dateModifier(days) {
  return `-${Math.max(0, days - 1)} days`;
}
__name(dateModifier, "dateModifier");
function bytesToHex5(bytes) {
  return Array.from(bytes).map(
    (value) => value.toString(16).padStart(2, "0")
  ).join("");
}
__name(bytesToHex5, "bytesToHex");
async function sha2565(value) {
  const digest = await crypto.subtle.digest(
    "SHA-256",
    new TextEncoder().encode(value)
  );
  return bytesToHex5(
    new Uint8Array(digest)
  );
}
__name(sha2565, "sha256");
function getGeo(request) {
  const cf = request.cf;
  const latitude = Number(cf?.latitude);
  const longitude = Number(cf?.longitude);
  return {
    countryCode: cleanString(
      cf?.country,
      "XX"
    ) || "XX",
    region: cleanString(
      cf?.region,
      "Unknown"
    ) || "Unknown",
    city: cleanString(
      cf?.city,
      "Unknown"
    ) || "Unknown",
    latitude: Number.isFinite(latitude) ? latitude : null,
    longitude: Number.isFinite(longitude) ? longitude : null
  };
}
__name(getGeo, "getGeo");
async function recordVisit(request, env) {
  let body;
  try {
    body = await request.json();
  } catch {
    return jsonResponse11(
      {
        error: "Invalid analytics request."
      },
      400
    );
  }
  const visitorId = cleanString(body.visitorId);
  if (!visitorId || visitorId.length > 200) {
    return jsonResponse11(
      {
        error: "Invalid visitor identifier."
      },
      400
    );
  }
  const today = (/* @__PURE__ */ new Date()).toISOString().slice(0, 10);
  const analyticsEnv = env;
  const salt = analyticsEnv.ANALYTICS_HASH_SALT ?? "gyan-analytics-v1";
  const visitorHash = await sha2565(
    `${today}|${visitorId}|${salt}`
  );
  const geo = getGeo(request);
  const dedupeResult = await env.gyan_registry.prepare(
    `
        INSERT OR IGNORE
        INTO daily_analytics_visitors (
          analytics_date,
          visitor_hash,
          country_code,
          region,
          city
        )
        VALUES (?, ?, ?, ?, ?)
        `
  ).bind(
    today,
    visitorHash,
    geo.countryCode,
    geo.region,
    geo.city
  ).run();
  const isUnique = Number(
    dedupeResult.meta.changes ?? 0
  ) > 0;
  await env.gyan_registry.prepare(
    `
      INSERT INTO daily_analytics (
        analytics_date,
        country_code,
        region,
        city,
        latitude,
        longitude,
        unique_visitors,
        visits,
        updated_at
      )
      VALUES (?, ?, ?, ?, ?, ?, ?, 1, CURRENT_TIMESTAMP)
      ON CONFLICT (
        analytics_date,
        country_code,
        region,
        city
      )
      DO UPDATE SET
        visits =
          daily_analytics.visits + 1,
        unique_visitors =
          daily_analytics.unique_visitors +
          excluded.unique_visitors,
        latitude = COALESCE(
          daily_analytics.latitude,
          excluded.latitude
        ),
        longitude = COALESCE(
          daily_analytics.longitude,
          excluded.longitude
        ),
        updated_at = CURRENT_TIMESTAMP
      `
  ).bind(
    today,
    geo.countryCode,
    geo.region,
    geo.city,
    geo.latitude,
    geo.longitude,
    isUnique ? 1 : 0
  ).run();
  return jsonResponse11({
    recorded: true,
    uniqueToday: isUnique
  });
}
__name(recordVisit, "recordVisit");
async function safeCount(env, sql, bindings = []) {
  try {
    const row = await env.gyan_registry.prepare(sql).bind(...bindings).first();
    return Number(row?.count ?? 0);
  } catch (error) {
    console.debug(
      "Optional analytics metric unavailable:",
      error
    );
    return 0;
  }
}
__name(safeCount, "safeCount");
async function getPuzzleWinCounts(env, modifier) {
  try {
    const columns = await env.gyan_registry.prepare(
      "PRAGMA table_info(puzzle_winners)"
    ).all();
    if (!columns.results.length) {
      return {};
    }
    const names = new Set(
      columns.results.map(
        (column) => column.name
      )
    );
    const sizeColumn = [
      "size",
      "puzzle_size",
      "board_size",
      "stage"
    ].find(
      (name) => names.has(name)
    );
    const dateColumn = [
      "created_at",
      "won_at",
      "completed_at"
    ].find(
      (name) => names.has(name)
    );
    if (!sizeColumn) {
      return {};
    }
    const where = dateColumn ? `WHERE date(${dateColumn}) >= date('now', ?)` : "";
    const result = await env.gyan_registry.prepare(
      `
          SELECT
            CAST(${sizeColumn} AS TEXT)
              AS label,
            COUNT(*) AS count
          FROM puzzle_winners
          ${where}
          GROUP BY ${sizeColumn}
          `
    ).bind(
      ...dateColumn ? [modifier] : []
    ).all();
    const counts = {};
    for (const row of result.results) {
      const label = String(row.label).trim().toLowerCase();
      if (label === "5" || label === "5x5" || label.includes("5x5")) {
        counts["5x5"] = Number(row.count);
      } else if (label === "7" || label === "7x7" || label.includes("7x7")) {
        counts["7x7"] = Number(row.count);
      } else {
        counts[String(row.label)] = Number(row.count);
      }
    }
    return counts;
  } catch (error) {
    console.debug(
      "Puzzle analytics unavailable:",
      error
    );
    return {};
  }
}
__name(getPuzzleWinCounts, "getPuzzleWinCounts");
async function analyticsReport(env, url) {
  const period = normalizePeriod(
    url.searchParams.get("period")
  );
  const days = periodDays(period);
  const modifier = dateModifier(days);
  const totals = await env.gyan_registry.prepare(
    `
        SELECT
          COALESCE(SUM(unique_visitors), 0)
            AS unique_visitors,
          COALESCE(SUM(visits), 0)
            AS visits
        FROM daily_analytics
        WHERE analytics_date >=
          date('now', ?)
        `
  ).bind(modifier).first();
  const mapResult2 = await env.gyan_registry.prepare(
    `
        SELECT
          country_code,
          region,
          city,
          AVG(latitude) AS latitude,
          AVG(longitude) AS longitude,
          SUM(unique_visitors)
            AS unique_visitors,
          SUM(visits) AS visits
        FROM daily_analytics
        WHERE analytics_date >=
          date('now', ?)
        GROUP BY
          country_code,
          region,
          city
        ORDER BY unique_visitors DESC
        `
  ).bind(modifier).all();
  const trendResult = await env.gyan_registry.prepare(
    `
        SELECT
          analytics_date,
          SUM(unique_visitors)
            AS unique_visitors,
          SUM(visits) AS visits
        FROM daily_analytics
        WHERE analytics_date >=
          date('now', ?)
        GROUP BY analytics_date
        ORDER BY analytics_date
        `
  ).bind(modifier).all();
  const [
    shopsTotal,
    newShops,
    adsSubmitted,
    adsApproved,
    serviceRequests,
    requestsToShops,
    requestsToSupport,
    registeredUsers,
    puzzleWins
  ] = await Promise.all([
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM shops
       WHERE code != 'SUPP'`
    ),
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM shops
       WHERE code != 'SUPP'
         AND date(created_at) >=
           date('now', ?)`,
      [modifier]
    ),
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM advertisement_submissions
       WHERE date(created_at) >=
         date('now', ?)`,
      [modifier]
    ),
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM advertisement_submissions
       WHERE status = 'approved'
         AND date(approved_at) >=
           date('now', ?)`,
      [modifier]
    ),
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM local_service_requests
       WHERE date(created_at) >=
         date('now', ?)`,
      [modifier]
    ),
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM local_service_requests
       WHERE assigned_shop_code IS NOT NULL
         AND assigned_shop_code != 'SUPP'
         AND date(created_at) >=
           date('now', ?)`,
      [modifier]
    ),
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM local_service_requests
       WHERE assigned_shop_code = 'SUPP'
         AND date(created_at) >=
           date('now', ?)`,
      [modifier]
    ),
    // Automatically becomes useful once
    // a real users table exists.
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM users`
    ),
    getPuzzleWinCounts(
      env,
      modifier
    )
  ]);
  return jsonResponse11({
    period,
    days,
    summary: {
      uniqueVisitors: Number(
        totals?.unique_visitors ?? 0
      ),
      visits: Number(totals?.visits ?? 0),
      registeredUsers,
      registeredShops: shopsTotal,
      newShops,
      adsSubmitted,
      adsApproved,
      serviceRequests,
      requestsToShops,
      requestsToSupport,
      puzzleWins
    },
    mapPoints: mapResult2.results.map((row) => ({
      countryCode: row.country_code,
      region: row.region,
      city: row.city,
      latitude: row.latitude == null ? null : Number(row.latitude),
      longitude: row.longitude == null ? null : Number(row.longitude),
      uniqueVisitors: Number(row.unique_visitors),
      visits: Number(row.visits)
    })),
    trend: trendResult.results.map((row) => ({
      date: row.analytics_date,
      uniqueVisitors: Number(row.unique_visitors),
      visits: Number(row.visits)
    }))
  });
}
__name(analyticsReport, "analyticsReport");
function valueText(value) {
  if (value === null || value === void 0) {
    return "";
  }
  return String(
    value
  ).trim();
}
__name(valueText, "valueText");
function firstValue(row, names) {
  for (const name of names) {
    const value = valueText(
      row[name]
    );
    if (value) {
      return value;
    }
  }
  return "";
}
__name(firstValue, "firstValue");
async function requireAnalyticsAdmin(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (session) {
    return null;
  }
  return jsonResponse11(
    {
      error: "Administrator authentication is required."
    },
    401
  );
}
__name(requireAnalyticsAdmin, "requireAnalyticsAdmin");
function normalizeDetailMetric(value) {
  switch (value) {
    case "visitors":
    case "visits":
    case "users":
    case "shops":
    case "ads":
    case "ads-approved":
    case "requests":
    case "requests-shops":
    case "requests-support":
    case "shops-new":
    case "puzzle-5":
    case "puzzle-7":
    case "location":
    case "trend-date":
      return value;
    default:
      return null;
  }
}
__name(normalizeDetailMetric, "normalizeDetailMetric");
async function getPuzzleDetailRows(env, size, modifier) {
  try {
    const columns = await env.gyan_registry.prepare(
      "PRAGMA table_info(puzzle_winners)"
    ).all();
    if (!columns.results.length) {
      return [];
    }
    const names = new Set(
      columns.results.map(
        (column) => column.name
      )
    );
    const sizeColumn = [
      "size",
      "puzzle_size",
      "board_size",
      "stage"
    ].find(
      (name) => names.has(
        name
      )
    );
    const dateColumn = [
      "created_at",
      "won_at",
      "completed_at"
    ].find(
      (name) => names.has(
        name
      )
    );
    if (!sizeColumn) {
      return [];
    }
    const whereParts = [
      `(
          CAST(${sizeColumn} AS TEXT) = ?
          OR lower(CAST(${sizeColumn} AS TEXT)) = ?
        )`
    ];
    const bindings = [
      size,
      `${size}x${size}`
    ];
    if (dateColumn) {
      whereParts.push(
        `date(${dateColumn}) >= date('now', ?)`
      );
      bindings.push(
        modifier
      );
    }
    const result = await env.gyan_registry.prepare(
      `
          SELECT *

          FROM puzzle_winners

          WHERE
            ${whereParts.join(
        "\nAND "
      )}

          ORDER BY
            ${dateColumn ?? "rowid"}
            DESC

          LIMIT 100
          `
    ).bind(
      ...bindings
    ).all();
    return result.results.map(
      (row, index) => {
        const winner = firstValue(
          row,
          [
            "winner_name",
            "display_name",
            "name",
            "email",
            "player_name"
          ]
        ) || `Winner ${index + 1}`;
        const location = [
          firstValue(
            row,
            [
              "city"
            ]
          ),
          firstValue(
            row,
            [
              "region",
              "state"
            ]
          ),
          firstValue(
            row,
            [
              "country",
              "country_code"
            ]
          )
        ].filter(
          Boolean
        ).join(
          ", "
        );
        const date = dateColumn ? valueText(
          row[dateColumn]
        ) : "";
        const puzzleId = firstValue(
          row,
          [
            "puzzle_id",
            "puzzle_number",
            "week_key",
            "week"
          ]
        );
        return {
          id: firstValue(
            row,
            [
              "id"
            ]
          ) || `puzzle-${size}-${index}`,
          title: winner,
          subtitle: location || `${size}\xD7${size} puzzle winner`,
          meta: [
            puzzleId ? `Puzzle ${puzzleId}` : "",
            date
          ].filter(
            Boolean
          ).join(
            " \xB7 "
          ),
          badge: `${size}\xD7${size}`
        };
      }
    );
  } catch (error) {
    console.debug(
      "Puzzle winner details unavailable:",
      error
    );
    return [];
  }
}
__name(getPuzzleDetailRows, "getPuzzleDetailRows");
async function analyticsDetails(env, url) {
  const metric = normalizeDetailMetric(
    url.searchParams.get(
      "metric"
    )
  );
  if (!metric) {
    return jsonResponse11(
      {
        error: "Unknown analytics detail metric."
      },
      400
    );
  }
  const period = normalizePeriod(
    url.searchParams.get(
      "period"
    )
  );
  const modifier = dateModifier(
    periodDays(
      period
    )
  );
  const country = cleanString(
    url.searchParams.get(
      "country"
    )
  );
  const region = cleanString(
    url.searchParams.get(
      "region"
    )
  );
  const city = cleanString(
    url.searchParams.get(
      "city"
    )
  );
  const requestedDate = cleanString(
    url.searchParams.get(
      "date"
    )
  );
  let title = "Analytics details";
  let rows = [];
  if (metric === "visitors" || metric === "visits") {
    title = metric === "visitors" ? "Unique visitors" : "Visits";
    const result = await env.gyan_registry.prepare(
      `
          SELECT
            country_code,
            region,
            city,

            SUM(
              unique_visitors
            ) AS unique_visitors,

            SUM(
              visits
            ) AS visits

          FROM daily_analytics

          WHERE
            analytics_date >=
              date(
                'now',
                ?
              )

          GROUP BY
            country_code,
            region,
            city

          ORDER BY
            ${metric === "visitors" ? "unique_visitors" : "visits"}
            DESC

          LIMIT 100
          `
    ).bind(
      modifier
    ).all();
    rows = result.results.map(
      (row, index) => ({
        id: `geo-${index}`,
        title: row.city || "Unknown city",
        subtitle: [
          row.region,
          row.country_code
        ].filter(
          Boolean
        ).join(
          ", "
        ),
        meta: `${Number(
          row.unique_visitors
        ).toLocaleString()} visitors \xB7 ${Number(
          row.visits
        ).toLocaleString()} visits`
      })
    );
  } else if (metric === "shops" || metric === "shops-new") {
    title = metric === "shops-new" ? "New shops" : "Registered shops";
    const newOnly = metric === "shops-new" ? `
          AND date(
            created_at
          ) >= date(
            'now',
            ?
          )
        ` : "";
    const result = await env.gyan_registry.prepare(
      `
          SELECT
            code,
            name,
            city,
            state,
            status,
            created_at

          FROM shops

          WHERE
            code !=
              'SUPP'

            ${newOnly}

          ORDER BY
            created_at
            DESC

          LIMIT 100
          `
    ).bind(
      ...metric === "shops-new" ? [
        modifier
      ] : []
    ).all();
    rows = result.results.map(
      (row) => ({
        id: row.code,
        title: row.name,
        subtitle: [
          row.city,
          row.state
        ].filter(
          Boolean
        ).join(
          ", "
        ),
        meta: `${row.code} \xB7 ${row.created_at}`,
        badge: row.status
      })
    );
  } else if (metric === "ads" || metric === "ads-approved") {
    title = metric === "ads-approved" ? "Approved advertisements" : "Advertisements submitted";
    const approvedOnly = metric === "ads-approved" ? `
          AND status =
            'approved'

          AND date(
            approved_at
          ) >= date(
            'now',
            ?
          )
        ` : `
          AND date(
            created_at
          ) >= date(
            'now',
            ?
          )
        `;
    const result = await env.gyan_registry.prepare(
      `
          SELECT
            id,
            business_name,
            service_name,
            discount_percent,

            city,
            region,
            region_code,

            email,
            status,
            created_at,
            approved_at

          FROM advertisement_submissions

          WHERE
            1 = 1

            ${approvedOnly}

          ORDER BY
            COALESCE(
              approved_at,
              created_at
            )
            DESC

          LIMIT 100
          `
    ).bind(
      modifier
    ).all();
    rows = result.results.map(
      (row) => ({
        id: String(
          row.id
        ),
        title: row.business_name,
        subtitle: row.service_name,
        meta: [
          row.discount_percent != null ? `${row.discount_percent}% discount` : "",
          [
            row.city || "Not available",
            row.region_code || "NA"
          ].join(
            ", "
          ),
          row.email,
          row.approved_at ?? row.created_at
        ].filter(
          Boolean
        ).join(
          " \xB7 "
        ),
        badge: row.status
      })
    );
  } else if (metric === "requests" || metric === "requests-shops" || metric === "requests-support") {
    title = metric === "requests-shops" ? "Requests routed to shops" : metric === "requests-support" ? "Requests routed to GYAN Support" : "Service requests";
    let assignmentClause = "";
    if (metric === "requests-shops") {
      assignmentClause = `
        AND assigned_shop_code
          IS NOT NULL

        AND assigned_shop_code !=
          'SUPP'
        `;
    } else if (metric === "requests-support") {
      assignmentClause = `
        AND assigned_shop_code =
          'SUPP'
        `;
    }
    const result = await env.gyan_registry.prepare(
      `
          SELECT
            id,
            service_name,
            details,
            email,
            phone,
            preferred_time,

            latitude,
            longitude,

            city,
            region,
            region_code,
            country_code,
            postal_code,

            status,
            assigned_shop_code,
            created_at

          FROM local_service_requests

          WHERE
            date(
              created_at
            ) >= date(
              'now',
              ?
            )

            ${assignmentClause}

          ORDER BY
            created_at
            DESC

          LIMIT 100
          `
    ).bind(
      modifier
    ).all();
    rows = result.results.map(
      (row) => ({
        id: String(
          row.id
        ),
        title: row.service_name,
        subtitle: row.details || row.email,
        meta: [
          [
            row.city ?? "",
            row.region_code || row.region || ""
          ].filter(
            Boolean
          ).join(
            ", "
          ),
          row.latitude != null && row.longitude != null ? `${Number(
            row.latitude
          ).toFixed(
            4
          )}, ${Number(
            row.longitude
          ).toFixed(
            4
          )}` : "",
          row.assigned_shop_code ? `Assigned ${row.assigned_shop_code}` : "Not assigned",
          row.preferred_time || "",
          row.created_at
        ].filter(
          Boolean
        ).join(
          " \xB7 "
        ),
        badge: row.status
      })
    );
  } else if (metric === "users") {
    title = "Registered users";
    try {
      const table = await env.gyan_registry.prepare(
        `
            SELECT
              COUNT(*) AS count

            FROM sqlite_master

            WHERE
              type =
                'table'

              AND name =
                'users'
            `
      ).first();
      if (Number(
        table?.count ?? 0
      ) > 0) {
        const result = await env.gyan_registry.prepare(
          `
              SELECT *

              FROM users

              ORDER BY
                rowid
                DESC

              LIMIT 100
              `
        ).all();
        rows = result.results.map(
          (row, index) => ({
            id: firstValue(
              row,
              [
                "id",
                "user_id"
              ]
            ) || `user-${index}`,
            title: firstValue(
              row,
              [
                "name",
                "display_name",
                "email",
                "phone"
              ]
            ) || `User ${index + 1}`,
            subtitle: firstValue(
              row,
              [
                "email",
                "phone"
              ]
            ),
            meta: [
              [
                firstValue(
                  row,
                  [
                    "last_city"
                  ]
                ) || "Not available",
                firstValue(
                  row,
                  [
                    "last_region_code",
                    "last_region"
                  ]
                ) || "NA"
              ].join(
                ", "
              ),
              firstValue(
                row,
                [
                  "created_at",
                  "updated_at"
                ]
              )
            ].filter(
              Boolean
            ).join(
              " \xB7 "
            ),
            badge: firstValue(
              row,
              [
                "status",
                "role"
              ]
            ) || void 0
          })
        );
      }
    } catch (error) {
      console.debug(
        "Registered-user details unavailable:",
        error
      );
    }
  } else if (metric === "puzzle-5" || metric === "puzzle-7") {
    const size = metric === "puzzle-5" ? "5" : "7";
    title = `${size}\xD7${size} puzzle winners`;
    rows = await getPuzzleDetailRows(
      env,
      size,
      modifier
    );
  } else if (metric === "location") {
    title = [
      city,
      region,
      country
    ].filter(
      Boolean
    ).join(
      ", "
    ) || "Location activity";
    const result = await env.gyan_registry.prepare(
      `
          SELECT
            analytics_date,
            unique_visitors,
            visits

          FROM daily_analytics

          WHERE
            analytics_date >=
              date(
                'now',
                ?
              )

            AND country_code =
              ?

            AND region =
              ?

            AND city =
              ?

          ORDER BY
            analytics_date
            DESC

          LIMIT 100
          `
    ).bind(
      modifier,
      country,
      region,
      city
    ).all();
    rows = result.results.map(
      (row) => ({
        id: row.analytics_date,
        title: row.analytics_date,
        subtitle: `${Number(
          row.unique_visitors
        ).toLocaleString()} unique visitors`,
        meta: `${Number(
          row.visits
        ).toLocaleString()} visits`
      })
    );
  } else if (metric === "trend-date") {
    title = requestedDate ? `Activity on ${requestedDate}` : "Daily activity";
    if (requestedDate) {
      const result = await env.gyan_registry.prepare(
        `
            SELECT
              country_code,
              region,
              city,
              unique_visitors,
              visits

            FROM daily_analytics

            WHERE
              analytics_date =
                ?

            ORDER BY
              unique_visitors
              DESC,
              visits
              DESC

            LIMIT 100
            `
      ).bind(
        requestedDate
      ).all();
      rows = result.results.map(
        (row, index) => ({
          id: `day-${index}`,
          title: row.city || "Unknown city",
          subtitle: [
            row.region,
            row.country_code
          ].filter(
            Boolean
          ).join(
            ", "
          ),
          meta: `${Number(
            row.unique_visitors
          ).toLocaleString()} visitors \xB7 ${Number(
            row.visits
          ).toLocaleString()} visits`
        })
      );
    }
  }
  return jsonResponse11({
    metric,
    period,
    title,
    total: rows.length,
    rows
  });
}
__name(analyticsDetails, "analyticsDetails");
async function cleanupAnalytics(env) {
  await env.gyan_registry.prepare(
    `DELETE FROM daily_analytics_visitors
       WHERE analytics_date <
         date('now', '-30 days')`
  ).run();
  await env.gyan_registry.prepare(
    `DELETE FROM daily_analytics
       WHERE analytics_date <
         date('now', '-365 days')`
  ).run();
}
__name(cleanupAnalytics, "cleanupAnalytics");
async function handleAnalyticsRoute(request, env, url) {
  if (request.method === "POST" && url.pathname === "/api/analytics/visit") {
    return recordVisit(
      request,
      env
    );
  }
  if (request.method === "GET" && (url.pathname === "/api/admin/analytics" || url.pathname === "/api/admin/analytics/details")) {
    const authResponse = await requireAnalyticsAdmin(
      request,
      env
    );
    if (authResponse) {
      return authResponse;
    }
    if (url.pathname === "/api/admin/analytics/details") {
      return analyticsDetails(
        env,
        url
      );
    }
    return analyticsReport(
      env,
      url
    );
  }
  return null;
}
__name(handleAnalyticsRoute, "handleAnalyticsRoute");

// worker/chat.ts
init_modules_watch_stub();
var SESSION_COOKIE2 = "gyan_session";
var MAX_MESSAGE_LENGTH = 2e3;
function jsonResponse12(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(jsonResponse12, "jsonResponse");
function cookieValue2(request, name) {
  const cookie = request.headers.get(
    "cookie"
  );
  if (!cookie) {
    return null;
  }
  for (const item of cookie.split(";")) {
    const [
      key,
      ...rest
    ] = item.trim().split("=");
    if (key === name) {
      return decodeURIComponent(
        rest.join("=")
      );
    }
  }
  return null;
}
__name(cookieValue2, "cookieValue");
function bytesToHex6(bytes) {
  return Array.from(bytes).map(
    (value) => value.toString(16).padStart(2, "0")
  ).join("");
}
__name(bytesToHex6, "bytesToHex");
async function sha2566(value) {
  const digest = await crypto.subtle.digest(
    "SHA-256",
    new TextEncoder().encode(value)
  );
  return bytesToHex6(
    new Uint8Array(
      digest
    )
  );
}
__name(sha2566, "sha256");
async function currentUser2(request, env) {
  const token = cookieValue2(
    request,
    SESSION_COOKIE2
  );
  if (!token) {
    return null;
  }
  const hash = await sha2566(token);
  return env.gyan_registry.prepare(
    `
      SELECT
        users.id,
        users.email
      FROM user_sessions
      INNER JOIN users
        ON users.id =
           user_sessions.user_id
      WHERE
        user_sessions.token_hash = ?
        AND user_sessions.expires_at >
            CURRENT_TIMESTAMP
      LIMIT 1
      `
  ).bind(hash).first();
}
__name(currentUser2, "currentUser");
async function loadOwnedRequest(env, user, requestNumber) {
  return env.gyan_registry.prepare(
    `
      SELECT
        sr.id,
        sr.request_number,
        sr.shop_code,
        sr.email_address,
        sr.status,
        sr.created_at,
        s.name AS service_name,
        sh.name AS shop_name
      FROM service_requests sr
      INNER JOIN services s
        ON s.id = sr.service_id
      INNER JOIN shops sh
        ON sh.code = sr.shop_code
      WHERE
        sr.request_number = ?
        AND lower(
          COALESCE(
            sr.email_address,
            ''
          )
        ) = lower(?)
      LIMIT 1
      `
  ).bind(
    requestNumber,
    user.email
  ).first();
}
__name(loadOwnedRequest, "loadOwnedRequest");
async function ensureThread(env, user, serviceRequest) {
  await env.gyan_registry.prepare(
    `
      INSERT INTO chat_threads (
        request_id,
        customer_user_id,
        shop_code
      )
      VALUES (?, ?, ?)
      ON CONFLICT(request_id)
      DO UPDATE SET
        customer_user_id =
          COALESCE(
            chat_threads.customer_user_id,
            excluded.customer_user_id
          ),
        updated_at =
          CURRENT_TIMESTAMP
      `
  ).bind(
    serviceRequest.id,
    user.id,
    serviceRequest.shop_code
  ).run();
  const thread = await env.gyan_registry.prepare(
    `
        SELECT
          id,
          request_id,
          customer_user_id,
          shop_code,
          status,
          created_at,
          updated_at
        FROM chat_threads
        WHERE request_id = ?
        LIMIT 1
        `
  ).bind(
    serviceRequest.id
  ).first();
  if (!thread) {
    throw new Error(
      "Chat thread could not be created."
    );
  }
  return thread;
}
__name(ensureThread, "ensureThread");
async function listThreads(request, env) {
  const user = await currentUser2(
    request,
    env
  );
  if (!user) {
    return jsonResponse12(
      {
        error: "Sign in to view your chats."
      },
      401
    );
  }
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          sr.request_number,
          sr.status AS request_status,
          sr.created_at AS request_created_at,
          s.name AS service_name,
          sh.name AS shop_name,
          ct.id AS thread_id,
          ct.updated_at AS chat_updated_at,
          (
            SELECT cm.message
            FROM chat_messages cm
            WHERE cm.thread_id = ct.id
            ORDER BY cm.id DESC
            LIMIT 1
          ) AS last_message
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        INNER JOIN shops sh
          ON sh.code = sr.shop_code
        LEFT JOIN chat_threads ct
          ON ct.request_id = sr.id
        WHERE
          lower(
            COALESCE(
              sr.email_address,
              ''
            )
          ) = lower(?)
        ORDER BY
          COALESCE(
            ct.updated_at,
            sr.created_at
          ) DESC
        LIMIT 100
        `
  ).bind(user.email).all();
  return jsonResponse12({
    threads: result.results.map(
      (row) => ({
        requestNumber: row.request_number,
        requestStatus: row.request_status,
        requestCreatedAt: row.request_created_at,
        serviceName: row.service_name,
        shopName: row.shop_name,
        threadId: row.thread_id,
        chatUpdatedAt: row.chat_updated_at,
        lastMessage: row.last_message
      })
    )
  });
}
__name(listThreads, "listThreads");
async function getThread(request, env, url) {
  const user = await currentUser2(
    request,
    env
  );
  if (!user) {
    return jsonResponse12(
      {
        error: "Sign in to use chat."
      },
      401
    );
  }
  const requestNumber = (url.searchParams.get(
    "requestNumber"
  ) ?? "").trim().toUpperCase();
  if (!requestNumber) {
    return jsonResponse12(
      {
        error: "Request number is required."
      },
      400
    );
  }
  const serviceRequest = await loadOwnedRequest(
    env,
    user,
    requestNumber
  );
  if (!serviceRequest) {
    return jsonResponse12(
      {
        error: "Request not found or it does not belong to this account."
      },
      404
    );
  }
  const thread = await ensureThread(
    env,
    user,
    serviceRequest
  );
  const messages = await env.gyan_registry.prepare(
    `
        SELECT
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        FROM chat_messages
        WHERE thread_id = ?
        ORDER BY id ASC
        LIMIT 500
        `
  ).bind(thread.id).all();
  return jsonResponse12({
    thread: {
      id: thread.id,
      requestNumber: serviceRequest.request_number,
      requestStatus: serviceRequest.status,
      serviceName: serviceRequest.service_name,
      shopCode: serviceRequest.shop_code,
      shopName: serviceRequest.shop_name
    },
    messages: messages.results.map(
      (message) => ({
        id: message.id,
        senderType: message.sender_type,
        message: message.message,
        createdAt: message.created_at,
        mine: message.sender_type === "user" && message.sender_user_id === user.id
      })
    )
  });
}
__name(getThread, "getThread");
async function postMessage(request, env) {
  const user = await currentUser2(
    request,
    env
  );
  if (!user) {
    return jsonResponse12(
      {
        error: "Sign in to send messages."
      },
      401
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return jsonResponse12(
      {
        error: "Invalid request."
      },
      400
    );
  }
  const requestNumber = typeof body.requestNumber === "string" ? body.requestNumber.trim().toUpperCase() : "";
  const message = typeof body.message === "string" ? body.message.trim() : "";
  if (!message || message.length > MAX_MESSAGE_LENGTH) {
    return jsonResponse12(
      {
        error: `Message must contain 1-${MAX_MESSAGE_LENGTH} characters.`
      },
      400
    );
  }
  const serviceRequest = await loadOwnedRequest(
    env,
    user,
    requestNumber
  );
  if (!serviceRequest) {
    return jsonResponse12(
      {
        error: "Request not found or it does not belong to this account."
      },
      404
    );
  }
  const thread = await ensureThread(
    env,
    user,
    serviceRequest
  );
  const inserted = await env.gyan_registry.prepare(
    `
        INSERT INTO chat_messages (
          thread_id,
          sender_type,
          sender_user_id,
          message
        )
        VALUES (
          ?,
          'user',
          ?,
          ?
        )
        RETURNING
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        `
  ).bind(
    thread.id,
    user.id,
    message
  ).first();
  await env.gyan_registry.prepare(
    `
      UPDATE chat_threads
      SET updated_at =
        CURRENT_TIMESTAMP
      WHERE id = ?
      `
  ).bind(thread.id).run();
  return jsonResponse12(
    {
      message: inserted ? {
        id: inserted.id,
        senderType: inserted.sender_type,
        message: inserted.message,
        createdAt: inserted.created_at,
        mine: true
      } : null
    },
    201
  );
}
__name(postMessage, "postMessage");
async function listMyShops(request, env) {
  const user = await currentUser2(
    request,
    env
  );
  if (!user) {
    return jsonResponse12(
      {
        error: "Sign in to view your shops."
      },
      401
    );
  }
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          city,
          state,
          state_code
        FROM shops
        WHERE
          lower(
            COALESCE(
              email_address,
              ''
            )
          ) = lower(?)
          AND status = 'active'
        ORDER BY
          name ASC,
          code ASC
        `
  ).bind(
    user.email
  ).all();
  return jsonResponse12({
    shops: result.results.map(
      (shop) => ({
        code: shop.code,
        name: shop.name,
        city: shop.city,
        state: shop.state,
        stateCode: shop.state_code
      })
    )
  });
}
__name(listMyShops, "listMyShops");
async function loadOwnedShop(env, user, shopCode) {
  return env.gyan_registry.prepare(
    `
      SELECT
        code,
        name
      FROM shops
      WHERE
        code = ?
        AND lower(
          COALESCE(
            email_address,
            ''
          )
        ) = lower(?)
        AND status = 'active'
      LIMIT 1
      `
  ).bind(
    shopCode,
    user.email
  ).first();
}
__name(loadOwnedShop, "loadOwnedShop");
async function listShopThreads(request, env, url) {
  const user = await currentUser2(
    request,
    env
  );
  if (!user) {
    return jsonResponse12(
      {
        error: "Sign in with the shop email to view messages."
      },
      401
    );
  }
  const shopCode = (url.searchParams.get(
    "shopCode"
  ) ?? "").trim().toUpperCase();
  if (!/^[A-Z0-9]{4}$/.test(
    shopCode
  )) {
    return jsonResponse12(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  const shop = await loadOwnedShop(
    env,
    user,
    shopCode
  );
  if (!shop) {
    return jsonResponse12(
      {
        error: "This account is not authorized for this shop."
      },
      403
    );
  }
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          sr.request_number,
          sr.status AS request_status,
          sr.created_at AS request_created_at,
          sr.customer_name,
          sr.email_address,
          s.name AS service_name,
          ct.id AS thread_id,
          ct.updated_at AS chat_updated_at,
          (
            SELECT cm.message
            FROM chat_messages cm
            WHERE cm.thread_id = ct.id
            ORDER BY cm.id DESC
            LIMIT 1
          ) AS last_message
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        LEFT JOIN chat_threads ct
          ON ct.request_id = sr.id
        WHERE sr.shop_code = ?
        ORDER BY
          COALESCE(
            ct.updated_at,
            sr.created_at
          ) DESC
        LIMIT 100
        `
  ).bind(shopCode).all();
  return jsonResponse12({
    shop: {
      code: shop.code,
      name: shop.name
    },
    threads: result.results.map(
      (row) => ({
        requestNumber: row.request_number,
        requestStatus: row.request_status,
        requestCreatedAt: row.request_created_at,
        customerName: row.customer_name,
        customerEmail: row.email_address,
        serviceName: row.service_name,
        threadId: row.thread_id,
        chatUpdatedAt: row.chat_updated_at,
        lastMessage: row.last_message
      })
    )
  });
}
__name(listShopThreads, "listShopThreads");
async function getShopThread(request, env, url) {
  const user = await currentUser2(
    request,
    env
  );
  if (!user) {
    return jsonResponse12(
      {
        error: "Sign in with the shop email to view messages."
      },
      401
    );
  }
  const shopCode = (url.searchParams.get(
    "shopCode"
  ) ?? "").trim().toUpperCase();
  const requestNumber = (url.searchParams.get(
    "requestNumber"
  ) ?? "").trim().toUpperCase();
  const shop = await loadOwnedShop(
    env,
    user,
    shopCode
  );
  if (!shop) {
    return jsonResponse12(
      {
        error: "This account is not authorized for this shop."
      },
      403
    );
  }
  const serviceRequest = await env.gyan_registry.prepare(
    `
        SELECT
          sr.id,
          sr.request_number,
          sr.shop_code,
          sr.email_address,
          sr.status,
          sr.created_at,
          s.name AS service_name,
          sh.name AS shop_name
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        INNER JOIN shops sh
          ON sh.code = sr.shop_code
        WHERE
          sr.request_number = ?
          AND sr.shop_code = ?
        LIMIT 1
        `
  ).bind(
    requestNumber,
    shopCode
  ).first();
  if (!serviceRequest) {
    return jsonResponse12(
      {
        error: "Request not found for this shop."
      },
      404
    );
  }
  await env.gyan_registry.prepare(
    `
      INSERT INTO chat_threads (
        request_id,
        shop_code
      )
      VALUES (?, ?)
      ON CONFLICT(request_id)
      DO UPDATE SET
        updated_at =
          chat_threads.updated_at
      `
  ).bind(
    serviceRequest.id,
    shopCode
  ).run();
  const thread = await env.gyan_registry.prepare(
    `
        SELECT
          id,
          request_id,
          customer_user_id,
          shop_code,
          status,
          created_at,
          updated_at
        FROM chat_threads
        WHERE request_id = ?
        LIMIT 1
        `
  ).bind(
    serviceRequest.id
  ).first();
  if (!thread) {
    return jsonResponse12(
      {
        error: "Chat could not be opened."
      },
      500
    );
  }
  const messages = await env.gyan_registry.prepare(
    `
        SELECT
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        FROM chat_messages
        WHERE thread_id = ?
        ORDER BY id ASC
        LIMIT 500
        `
  ).bind(thread.id).all();
  return jsonResponse12({
    thread: {
      id: thread.id,
      requestNumber: serviceRequest.request_number,
      requestStatus: serviceRequest.status,
      serviceName: serviceRequest.service_name,
      shopCode,
      shopName: shop.name
    },
    messages: messages.results.map(
      (message) => ({
        id: message.id,
        senderType: message.sender_type,
        message: message.message,
        createdAt: message.created_at,
        mine: message.sender_type === "shop" && message.sender_shop_code === shopCode
      })
    )
  });
}
__name(getShopThread, "getShopThread");
async function postShopMessage(request, env) {
  const user = await currentUser2(
    request,
    env
  );
  if (!user) {
    return jsonResponse12(
      {
        error: "Sign in with the shop email to reply."
      },
      401
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return jsonResponse12(
      {
        error: "Invalid request."
      },
      400
    );
  }
  const shopCode = typeof body.shopCode === "string" ? body.shopCode.trim().toUpperCase() : "";
  const requestNumber = typeof body.requestNumber === "string" ? body.requestNumber.trim().toUpperCase() : "";
  const message = typeof body.message === "string" ? body.message.trim() : "";
  if (!/^[A-Z0-9]{4}$/.test(
    shopCode
  ) || !requestNumber) {
    return jsonResponse12(
      {
        error: "Shop and request are required."
      },
      400
    );
  }
  if (!message || message.length > MAX_MESSAGE_LENGTH) {
    return jsonResponse12(
      {
        error: `Message must contain 1-${MAX_MESSAGE_LENGTH} characters.`
      },
      400
    );
  }
  const shop = await loadOwnedShop(
    env,
    user,
    shopCode
  );
  if (!shop) {
    return jsonResponse12(
      {
        error: "This account is not authorized for this shop."
      },
      403
    );
  }
  const serviceRequest = await env.gyan_registry.prepare(
    `
        SELECT
          sr.id,
          sr.request_number,
          sr.shop_code,
          sr.email_address,
          sr.status,
          sr.created_at,
          s.name AS service_name,
          sh.name AS shop_name
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        INNER JOIN shops sh
          ON sh.code = sr.shop_code
        WHERE
          sr.request_number = ?
          AND sr.shop_code = ?
        LIMIT 1
        `
  ).bind(
    requestNumber,
    shopCode
  ).first();
  if (!serviceRequest) {
    return jsonResponse12(
      {
        error: "Request not found for this shop."
      },
      404
    );
  }
  await env.gyan_registry.prepare(
    `
      INSERT INTO chat_threads (
        request_id,
        shop_code
      )
      VALUES (?, ?)
      ON CONFLICT(request_id)
      DO NOTHING
      `
  ).bind(
    serviceRequest.id,
    shopCode
  ).run();
  const thread = await env.gyan_registry.prepare(
    `
        SELECT id
        FROM chat_threads
        WHERE request_id = ?
        LIMIT 1
        `
  ).bind(
    serviceRequest.id
  ).first();
  if (!thread) {
    return jsonResponse12(
      {
        error: "Chat thread could not be created."
      },
      500
    );
  }
  const inserted = await env.gyan_registry.prepare(
    `
        INSERT INTO chat_messages (
          thread_id,
          sender_type,
          sender_shop_code,
          message
        )
        VALUES (
          ?,
          'shop',
          ?,
          ?
        )
        RETURNING
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        `
  ).bind(
    thread.id,
    shopCode,
    message
  ).first();
  await env.gyan_registry.prepare(
    `
      UPDATE chat_threads
      SET updated_at =
        CURRENT_TIMESTAMP
      WHERE id = ?
      `
  ).bind(thread.id).run();
  return jsonResponse12(
    {
      message: inserted ? {
        id: inserted.id,
        senderType: inserted.sender_type,
        message: inserted.message,
        createdAt: inserted.created_at,
        mine: true
      } : null
    },
    201
  );
}
__name(postShopMessage, "postShopMessage");
async function handleChatRoute(request, env, url) {
  if (request.method === "GET" && url.pathname === "/api/chat/threads") {
    return listThreads(
      request,
      env
    );
  }
  if (request.method === "GET" && url.pathname === "/api/chat/thread") {
    return getThread(
      request,
      env,
      url
    );
  }
  if (request.method === "POST" && url.pathname === "/api/chat/messages") {
    return postMessage(
      request,
      env
    );
  }
  if (request.method === "GET" && url.pathname === "/api/chat/my-shops") {
    return listMyShops(
      request,
      env
    );
  }
  if (request.method === "GET" && url.pathname === "/api/chat/shop/threads") {
    return listShopThreads(
      request,
      env,
      url
    );
  }
  if (request.method === "GET" && url.pathname === "/api/chat/shop/thread") {
    return getShopThread(
      request,
      env,
      url
    );
  }
  if (request.method === "POST" && url.pathname === "/api/chat/shop/messages") {
    return postShopMessage(
      request,
      env
    );
  }
  return null;
}
__name(handleChatRoute, "handleChatRoute");

// worker/index.ts
function createJsonResponse11(data, status = 200) {
  return new Response(
    JSON.stringify(
      data
    ),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse11, "createJsonResponse");
function normalizeShopCode7(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode7, "normalizeShopCode");
function normalizeRequiredText3(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeRequiredText3, "normalizeRequiredText");
function normalizeOptionalText3(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeOptionalText3, "normalizeOptionalText");
function mapShopRow(row) {
  return {
    code: row.code,
    name: row.name,
    ownerName: row.owner_name,
    phoneNumber: row.phone_number,
    whatsAppNumber: row.whatsapp_number ?? "",
    emailAddress: row.email_address ?? "",
    addressLine: row.address_line,
    city: row.city,
    state: row.state,
    postalCode: row.postal_code,
    status: row.status,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
}
__name(mapShopRow, "mapShopRow");
async function findShopByCode(env, code) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          owner_name,
          phone_number,
          whatsapp_number,
          email_address,
          address_line,
          city,
          state,
          postal_code,
          status,
          created_at,
          updated_at

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(
    code
  ).first();
}
__name(findShopByCode, "findShopByCode");
async function handleGetShop(env, rawShopCode) {
  const shopCode = normalizeShopCode7(
    rawShopCode
  );
  if (!shopCode) {
    return createJsonResponse11(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  const shop = await findShopByCode(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse11(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse11(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  return createJsonResponse11({
    shop: mapShopRow(
      shop
    )
  });
}
__name(handleGetShop, "handleGetShop");
async function handleRegisterShop(request, env) {
  let requestBody;
  try {
    requestBody = await request.json();
  } catch {
    return createJsonResponse11(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const code = normalizeShopCode7(
    requestBody.code
  );
  const name = normalizeRequiredText3(
    requestBody.name
  );
  const ownerName = normalizeRequiredText3(
    requestBody.ownerName
  );
  const phoneNumber = normalizeRequiredText3(
    requestBody.phoneNumber
  );
  const whatsAppNumber = normalizeOptionalText3(
    requestBody.whatsAppNumber
  );
  const emailAddress = normalizeOptionalText3(
    requestBody.emailAddress
  );
  const addressLine = normalizeRequiredText3(
    requestBody.addressLine
  );
  const city = normalizeRequiredText3(
    requestBody.city
  );
  const state = normalizeRequiredText3(
    requestBody.state
  );
  const postalCode = normalizeRequiredText3(
    requestBody.postalCode
  );
  if (!code || !name || !ownerName || !phoneNumber || !addressLine || !city || !state || !postalCode) {
    return createJsonResponse11(
      {
        error: "Shop code, shop name, owner, phone and address are required."
      },
      400
    );
  }
  const existingShop = await env.gyan_registry.prepare(
    `
          SELECT
            code

          FROM shops

          WHERE code = ?

          LIMIT 1
        `
  ).bind(
    code
  ).first();
  if (existingShop) {
    return createJsonResponse11(
      {
        error: "This shop code is already registered. Please generate another code."
      },
      409
    );
  }
  try {
    await env.gyan_registry.prepare(
      `
          INSERT INTO shops (
            code,
            name,
            owner_name,
            phone_number,
            whatsapp_number,
            email_address,
            address_line,
            city,
            state,
            postal_code,
            status
          )
          VALUES (
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            'active'
          )
        `
    ).bind(
      code,
      name,
      ownerName,
      phoneNumber,
      whatsAppNumber,
      emailAddress,
      addressLine,
      city,
      state,
      postalCode
    ).run();
  } catch (error) {
    console.error(
      "Shop registration failed:",
      error
    );
    return createJsonResponse11(
      {
        error: "The shop could not be registered."
      },
      500
    );
  }
  const createdShop = await findShopByCode(
    env,
    code
  );
  if (!createdShop) {
    return createJsonResponse11(
      {
        error: "The shop was saved but could not be loaded."
      },
      500
    );
  }
  return createJsonResponse11(
    {
      shop: mapShopRow(
        createdShop
      )
    },
    201
  );
}
__name(handleRegisterShop, "handleRegisterShop");
async function handleApiRequest(request, env, url) {
  const publicAuthResponse = await handlePublicAuthRoute(
    request,
    env,
    url
  );
  if (publicAuthResponse) {
    return publicAuthResponse;
  }
  const chatResponse = await handleChatRoute(
    request,
    env,
    url
  );
  if (chatResponse) {
    return chatResponse;
  }
  const adminAuthResponse = await handleAdminAuthRoute(
    request,
    env,
    url
  );
  if (adminAuthResponse) {
    return adminAuthResponse;
  }
  const puzzleAdminResponse = await handlePuzzleAdminRoute(
    request,
    env,
    url
  );
  if (puzzleAdminResponse) {
    return puzzleAdminResponse;
  }
  const adminServicesResponse = await handleAdminServicesRoute(
    request,
    env,
    url
  );
  if (adminServicesResponse) {
    return adminServicesResponse;
  }
  const adminServiceFormsResponse = await handleAdminServiceFormsRoute(
    request,
    env,
    url
  );
  if (adminServiceFormsResponse) {
    return adminServiceFormsResponse;
  }
  const adminShopsResponse = await handleAdminShopsRoute(
    request,
    env,
    url
  );
  if (adminShopsResponse) {
    return adminShopsResponse;
  }
  const adminStorageResponse = await handleAdminStorageRoute(
    request,
    env,
    url
  );
  if (adminStorageResponse) {
    return adminStorageResponse;
  }
  const analyticsResponse = await handleAnalyticsRoute(
    request,
    env,
    url
  );
  if (analyticsResponse) {
    return analyticsResponse;
  }
  const puzzleResponse = await handlePuzzleRoute(
    request,
    env,
    url
  );
  if (puzzleResponse) {
    return puzzleResponse;
  }
  const puzzleCertificateResponse = await handlePuzzleCertificateRoute(
    request,
    env,
    url
  );
  if (puzzleCertificateResponse) {
    return puzzleCertificateResponse;
  }
  const serviceCatalogResponse = await handleServiceCatalogRoute(
    request,
    env,
    url
  );
  if (serviceCatalogResponse) {
    return serviceCatalogResponse;
  }
  const locationResolveResponse = await handleLocationResolveRoute(
    request,
    url
  );
  if (locationResolveResponse) {
    return locationResolveResponse;
  }
  const locationHintResponse = handleLocationHintRoute(
    request,
    url
  );
  if (locationHintResponse) {
    return locationHintResponse;
  }
  const nearbyShopsResponse = await handleNearbyShopsRoute(
    request,
    env,
    url
  );
  if (nearbyShopsResponse) {
    return nearbyShopsResponse;
  }
  const serviceFormResponse = await handleServiceFormsRoute(
    request,
    env,
    url
  );
  if (serviceFormResponse) {
    return serviceFormResponse;
  }
  const serviceRequestResponse = await handleServiceRequestsRoute(
    request,
    env,
    url
  );
  if (serviceRequestResponse) {
    return serviceRequestResponse;
  }
  const sharedRequestResponse = await handleSharedRequestsRoute(
    request,
    env,
    url
  );
  if (sharedRequestResponse) {
    return sharedRequestResponse;
  }
  const printRequestsResponse = await handlePrintRequestsRoute(
    request,
    env,
    url
  );
  if (printRequestsResponse) {
    return printRequestsResponse;
  }
  const homeFeaturedResponse = await handleHomeFeaturedRoute(
    request,
    env,
    url
  );
  if (homeFeaturedResponse) {
    return homeFeaturedResponse;
  }
  if (request.method === "GET" && url.pathname === "/api/health") {
    return createJsonResponse11({
      status: "ok",
      service: "GYAN Cloud Shop Registry"
    });
  }
  if (request.method === "POST" && url.pathname === "/api/shops") {
    return handleRegisterShop(
      request,
      env
    );
  }
  const advertisementResponse = await handleAdvertisementRoute(
    request,
    env,
    url
  );
  if (advertisementResponse) {
    return advertisementResponse;
  }
  let localRequestLocation = null;
  if (request.method === "POST" && url.pathname === "/api/local-service-requests") {
    try {
      const body = await request.clone().json();
      localRequestLocation = {
        city: typeof body.city === "string" ? body.city.trim() : "",
        region: typeof body.region === "string" ? body.region.trim() : "",
        regionCode: typeof body.regionCode === "string" ? body.regionCode.trim().toUpperCase() : "",
        countryCode: typeof body.countryCode === "string" ? body.countryCode.trim().toUpperCase() : "",
        postalCode: typeof body.postalCode === "string" ? body.postalCode.trim() : ""
      };
    } catch {
    }
  }
  const localServiceRequestResponse = await handleLocalServiceRequestRoute(
    request,
    env,
    url
  );
  if (localServiceRequestResponse) {
    if (localServiceRequestResponse.ok && localRequestLocation) {
      try {
        const result = await localServiceRequestResponse.clone().json();
        const requestId = Number(
          result.requestId ?? result.request?.id
        );
        if (Number.isInteger(
          requestId
        ) && requestId > 0) {
          await env.gyan_registry.prepare(
            `
            UPDATE local_service_requests

            SET
              city = ?,
              region = ?,
              region_code = ?,
              country_code = ?,
              postal_code = ?

            WHERE id = ?
            `
          ).bind(
            localRequestLocation.city || null,
            localRequestLocation.region || null,
            localRequestLocation.regionCode || null,
            localRequestLocation.countryCode || null,
            localRequestLocation.postalCode || null,
            requestId
          ).run();
        }
      } catch (error) {
        console.error(
          "Unable to save service-request location snapshot:",
          error
        );
      }
    }
    return localServiceRequestResponse;
  }
  const shopRouteMatch = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})$/
  );
  if (request.method === "GET" && shopRouteMatch) {
    return handleGetShop(
      env,
      shopRouteMatch[1]
    );
  }
  return createJsonResponse11(
    {
      error: "API route not found."
    },
    404
  );
}
__name(handleApiRequest, "handleApiRequest");
var worker_default = {
  async fetch(request, env) {
    const url = new URL(
      request.url
    );
    try {
      if (url.pathname.startsWith(
        "/api/"
      )) {
        return await handleApiRequest(
          request,
          env,
          url
        );
      }
      return env.ASSETS.fetch(
        request
      );
    } catch (error) {
      console.error(
        "Unhandled Worker error:",
        error
      );
      return createJsonResponse11(
        {
          error: "An unexpected server error occurred."
        },
        500
      );
    }
  },
  async scheduled(controller, env, context) {
    context.waitUntil(
      Promise.all([
        reconcileExpiredStorage(
          env
        ).then(
          (result) => {
            console.log(
              "Storage reconciliation completed:",
              {
                cron: controller.cron,
                expiredFileCount: result.expiredFileCount,
                removedBytes: result.removedBytes
              }
            );
          }
        ).catch(
          (error) => {
            console.error(
              "Storage reconciliation failed:",
              error
            );
          }
        ),
        cleanupAnalytics(
          env
        ).then(
          () => {
            console.log(
              "Analytics cleanup completed."
            );
          }
        ).catch(
          (error) => {
            console.error(
              "Analytics cleanup failed:",
              error
            );
          }
        )
      ]).then(
        () => void 0
      )
    );
  }
};

// ../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/middleware/middleware-ensure-req-body-drained.ts
init_modules_watch_stub();
var drainBody = /* @__PURE__ */ __name(async (request, env, _ctx, middlewareCtx) => {
  try {
    return await middlewareCtx.next(request, env);
  } finally {
    try {
      if (request.body !== null && !request.bodyUsed) {
        const reader = request.body.getReader();
        while (!(await reader.read()).done) {
        }
      }
    } catch (e) {
      console.error("Failed to drain the unused request body.", e);
    }
  }
}, "drainBody");
var middleware_ensure_req_body_drained_default = drainBody;

// ../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/middleware/middleware-miniflare3-json-error.ts
init_modules_watch_stub();
function reduceError(e) {
  return {
    name: e?.name,
    message: e?.message ?? String(e),
    stack: e?.stack,
    cause: e?.cause === void 0 ? void 0 : reduceError(e.cause)
  };
}
__name(reduceError, "reduceError");
var jsonError = /* @__PURE__ */ __name(async (request, env, _ctx, middlewareCtx) => {
  try {
    return await middlewareCtx.next(request, env);
  } catch (e) {
    const error = reduceError(e);
    const body = JSON.stringify(error);
    const headers = {
      "Content-Type": "application/json",
      "MF-Experimental-Error-Stack": "true"
    };
    const encoded = encodeURIComponent(body);
    if (encoded.length <= 8192) {
      headers["MF-Experimental-Error-Stack-Payload"] = encoded;
    }
    return new Response(body, { status: 500, headers });
  }
}, "jsonError");
var middleware_miniflare3_json_error_default = jsonError;

// .wrangler/tmp/bundle-kGFB7o/middleware-insertion-facade.js
var __INTERNAL_WRANGLER_MIDDLEWARE__ = [
  middleware_ensure_req_body_drained_default,
  middleware_miniflare3_json_error_default
];
var middleware_insertion_facade_default = worker_default;

// ../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/middleware/common.ts
init_modules_watch_stub();
var __facade_middleware__ = [];
function __facade_register__(...args) {
  __facade_middleware__.push(...args.flat());
}
__name(__facade_register__, "__facade_register__");
function __facade_invokeChain__(request, env, ctx, dispatch, middlewareChain) {
  const [head, ...tail] = middlewareChain;
  const middlewareCtx = {
    dispatch,
    next(newRequest, newEnv) {
      return __facade_invokeChain__(newRequest, newEnv, ctx, dispatch, tail);
    }
  };
  return head(request, env, ctx, middlewareCtx);
}
__name(__facade_invokeChain__, "__facade_invokeChain__");
function __facade_invoke__(request, env, ctx, dispatch, finalMiddleware) {
  return __facade_invokeChain__(request, env, ctx, dispatch, [
    ...__facade_middleware__,
    finalMiddleware
  ]);
}
__name(__facade_invoke__, "__facade_invoke__");

// .wrangler/tmp/bundle-kGFB7o/middleware-loader.entry.ts
var __Facade_ScheduledController__ = class ___Facade_ScheduledController__ {
  constructor(scheduledTime, cron, noRetry) {
    this.scheduledTime = scheduledTime;
    this.cron = cron;
    this.#noRetry = noRetry;
  }
  scheduledTime;
  cron;
  static {
    __name(this, "__Facade_ScheduledController__");
  }
  #noRetry;
  noRetry() {
    if (!(this instanceof ___Facade_ScheduledController__)) {
      throw new TypeError("Illegal invocation");
    }
    this.#noRetry();
  }
};
function wrapExportedHandler(worker) {
  if (__INTERNAL_WRANGLER_MIDDLEWARE__ === void 0 || __INTERNAL_WRANGLER_MIDDLEWARE__.length === 0) {
    return worker;
  }
  for (const middleware of __INTERNAL_WRANGLER_MIDDLEWARE__) {
    __facade_register__(middleware);
  }
  const fetchDispatcher = /* @__PURE__ */ __name(function(request, env, ctx) {
    if (worker.fetch === void 0) {
      throw new Error("Handler does not export a fetch() function.");
    }
    return worker.fetch(request, env, ctx);
  }, "fetchDispatcher");
  return {
    ...worker,
    fetch(request, env, ctx) {
      const dispatcher = /* @__PURE__ */ __name(function(type, init) {
        if (type === "scheduled" && worker.scheduled !== void 0) {
          const controller = new __Facade_ScheduledController__(
            Date.now(),
            init.cron ?? "",
            () => {
            }
          );
          return worker.scheduled(controller, env, ctx);
        }
      }, "dispatcher");
      return __facade_invoke__(request, env, ctx, dispatcher, fetchDispatcher);
    }
  };
}
__name(wrapExportedHandler, "wrapExportedHandler");
function wrapWorkerEntrypoint(klass) {
  if (__INTERNAL_WRANGLER_MIDDLEWARE__ === void 0 || __INTERNAL_WRANGLER_MIDDLEWARE__.length === 0) {
    return klass;
  }
  for (const middleware of __INTERNAL_WRANGLER_MIDDLEWARE__) {
    __facade_register__(middleware);
  }
  return class extends klass {
    #fetchDispatcher = /* @__PURE__ */ __name((request, env, ctx) => {
      this.env = env;
      this.ctx = ctx;
      if (super.fetch === void 0) {
        throw new Error("Entrypoint class does not define a fetch() function.");
      }
      return super.fetch(request);
    }, "#fetchDispatcher");
    #dispatcher = /* @__PURE__ */ __name((type, init) => {
      if (type === "scheduled" && super.scheduled !== void 0) {
        const controller = new __Facade_ScheduledController__(
          Date.now(),
          init.cron ?? "",
          () => {
          }
        );
        return super.scheduled(controller);
      }
    }, "#dispatcher");
    fetch(request) {
      return __facade_invoke__(
        request,
        this.env,
        this.ctx,
        this.#dispatcher,
        this.#fetchDispatcher
      );
    }
  };
}
__name(wrapWorkerEntrypoint, "wrapWorkerEntrypoint");
var WRAPPED_ENTRY;
if (typeof middleware_insertion_facade_default === "object") {
  WRAPPED_ENTRY = wrapExportedHandler(middleware_insertion_facade_default);
} else if (typeof middleware_insertion_facade_default === "function") {
  WRAPPED_ENTRY = wrapWorkerEntrypoint(middleware_insertion_facade_default);
}
var middleware_loader_entry_default = WRAPPED_ENTRY;
export {
  __INTERNAL_WRANGLER_MIDDLEWARE__,
  middleware_loader_entry_default as default
};
//# sourceMappingURL=index.js.map
