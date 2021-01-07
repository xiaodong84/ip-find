package main

import (
	"fmt"
	"log"
	"net/http"
	"strings"
)

//IP 全局变量，用于保存IP，初始值是字符串null
var IP string = "null"

//GetIP 用于获取IP
func GetIP(w http.ResponseWriter, r *http.Request) {

	fmt.Fprintln(w, IP)
	log.Printf("%s: 获取了IP", strings.Split(r.RemoteAddr, ":")[0])
}

//SetIP 用于更新IP
func SetIP(w http.ResponseWriter, r *http.Request) {
	IP = strings.Split(r.RemoteAddr, ":")[0]
	fmt.Fprintln(w, "Successful")
	log.Printf("IP Address Update Success,Current IP [%s] \n", IP)
}

func main() {
	server := http.Server{
		Addr: "0.0.0.0:8080",
	}
	http.HandleFunc("/getip", GetIP)
	http.HandleFunc("/setip", SetIP)
	server.ListenAndServe()
}
