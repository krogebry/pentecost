// 

// sudo GOPATH=/usr/lib64/golang/src/pkg/ go get launchpad.net/goamz/ec2


package main

import (
  "sqs"
  "src/launchpad.net/goamz/aws"
  "log"
  "os"
)

func main() {

  key, secret := os.Getenv("AWS_KEY"), os.Getenv("AWS_SECRET")
  if key == "" || secret == "" {
    log.Fatal("Expected AWS_KEY and AWS_SECRET environment variables to be set")
  }
  auth := aws.Auth{key, secret}
  log.Print(auth)
  endpoint := sqs.New(auth, aws.Region{SQSEndpoint: "https://sqs.us-west-2.amazonaws.com/"})
  log.Print(endpoint)

  queue, err := endpoint.GetQueue("AwsPiControl")
  if err != nil {
    log.Fatal("GetQueue err", err)
  }
  log.Print("GetQueue", queue)

  resp, err := queue.ReceiveMessage([]string{"ALL"}, 1, 15)
  if err != nil {
    log.Fatal("ReceiveMessage err", err)
  }
  log.Print("ReceiveMessage", resp)

  log.Print("Done")
}
