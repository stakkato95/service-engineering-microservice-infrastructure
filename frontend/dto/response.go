package dto

type ResponseDto struct {
	Data  interface{} `json:"data,omitempty"`
	Error string      `json:"error,omitempty"`
}

type MiddleResponse struct {
	Data string `json:"data"`
}
