package main

import (
	"fmt"
	"log"
	"os"

	"github.com/urfave/cli/v2"
)

// Variable populated by gorelease https://goreleaser.com/environment/#using-the-mainversion
var (
	version = "dev"
	commit  = "none"
)

func main() {

	app := &cli.App{
		Name:      "release-app",
		Usage:     "Application for testing release process",
		Version:   fmt.Sprintf("%s %s", version, commit),
		UsageText: "release-app --version",
		Action: func(c *cli.Context) error {
			return nil
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
