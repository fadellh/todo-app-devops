package validationHelper

import (
	"regexp"
	"unicode"
)

// Validate That String Data Is A Digit
func StrIsDigit(data string) error {
	for _, v := range data {
		isDigit := unicode.IsDigit(v)
		if !isDigit {
			return ErrorStrIsNotDigit
		}
	}

	return nil
}

// Validate Phone Number With Indonesian Format
func ValidatePhoneNumber(data string) error {
	r, _ := regexp.Compile(RegexPhoneNumber)

	res := r.MatchString(data)
	if !res {
		return ErrorInvalidPhoneNumber
	}

	return nil
}
