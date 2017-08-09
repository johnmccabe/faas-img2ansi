package main

import (
	"bufio"
	"fmt"
	"image"
	"log"
	"os"

	"github.com/johnmccabe/img2ansi"
)

func main() {
	r := bufio.NewReader(os.Stdin)

	i, _, err := image.Decode(r)
	if err != nil {
		log.Fatalf("Error parsing image: %v", err)
	}

	ansi, err := img2ansi.RenderANSI256(i)
	if err != nil {
		log.Fatalf("Error converting image to ANSI: %v", err)
	}
	fmt.Print(ansi)
}
