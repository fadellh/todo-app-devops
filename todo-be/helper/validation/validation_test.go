package validationHelper

import (
	"testing"
)

func TestStrIsDigit(t *testing.T) {
	type args struct {
		data string
	}
	tests := []struct {
		name    string
		args    args
		wantErr bool
	}{
		{
			name: "success",
			args: args{
				data: "12345",
			},
		},
		{
			name: "failed",
			args: args{
				data: "12345a",
			},
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if err := StrIsDigit(tt.args.data); (err != nil) != tt.wantErr {
				t.Errorf("StrIsDigit() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}

func TestValidatePhoneNumber(t *testing.T) {
	type args struct {
		data string
	}
	tests := []struct {
		name    string
		args    args
		wantErr bool
	}{
		{
			name: "success",
			args: args{
				data: "08123456789",
			},
		},
		{
			name: "failed",
			args: args{
				data: "6281234567891234",
			},
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if err := ValidatePhoneNumber(tt.args.data); (err != nil) != tt.wantErr {
				t.Errorf("ValidatePhoneNumber() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}
