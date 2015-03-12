require 'date'

## BINARY MASKS
YEAR_MASK       = 0b11111111111111000000000
MONTH_MASK      = 0b00000000000000111100000
DAY_MASK        = 0b00000000000000000011111

ZERO_YEAR_MASK  = 0b00000000000000111111111
ZERO_MONTH_MASK = 0b11111111111111000011111
ZERO_DAY_MASK   = 0b11111111111111111100000

## PACK BITS
bits = (Date.today.year << 9)
bits = bits | (Date.today.month << 5)
bits = bits | (Date.today.day)

## UNPACK BITS
(bits & YEAR_MASK) >> 9
(bits & MONTH_MASK) >> 5
(bits & DAY_MASK)

## CHANGE BITS
date = Date.parse('2025-01-24')
bits = (bits & ZERO_YEAR_MASK) | (date.year << 9)
bits = (bits & ZERO_MONTH_MASK) | (date.month << 5)
bits = (bits & ZERO_DAY_MASK) | (date.day)
