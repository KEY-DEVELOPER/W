$ ffuf -h
Fuzz Faster U Fool - v2.1.0-dev

HTTP OPTIONS:
  -H                  Header `"Name: Value"`, separated by colon. Multiple -H flags are accepted.
  -X                  HTTP method to use
  -b                  Cookie data `"NAME1=VALUE1; NAME2=VALUE2"` for copy as curl functionality.
  -cc                 Client cert for authentication. Client key needs to be defined as well for this to work
  -ck                 Client key for authentication. Client certificate needs to be defined as well for this to work
  -d                  POST data
  -http2              Use HTTP2 protocol (default: false)
  -ignore-body        Do not fetch the response content. (default: false)
  -r                  Follow redirects (default: false)
  -raw                Do not encode URI (default: false)
  -recursion          Scan recursively. Only FUZZ keyword is supported, and URL (-u) has to end in it. (default: false)
  -recursion-depth    Maximum recursion depth. (default: 0)
  -recursion-strategy Recursion strategy: "default" for a redirect based, and "greedy" to recurse on all matches (default: default)
  -replay-proxy       Replay matched requests using this proxy.
  -sni                Target TLS SNI, does not support FUZZ keyword
  -timeout            HTTP request timeout in seconds. (default: 10)
  -u                  Target URL
  -x                  Proxy URL (SOCKS5 or HTTP). For example: http://127.0.0.1:8080 or socks5://127.0.0.1:8080

GENERAL OPTIONS:
  -V                  Show version information. (default: false)
  -ac                 Automatically calibrate filtering options (default: false)
  -acc                Custom auto-calibration string. Can be used multiple times. Implies -ac
  -ach                Per host autocalibration (default: false)
  -ack                Autocalibration keyword (default: FUZZ)
  -acs                Custom auto-calibration strategies. Can be used multiple times. Implies -ac
  -c                  Colorize output. (default: false)
  -config             Load configuration from a file
  -json               JSON output, printing newline-delimited JSON records (default: false)
  -maxtime            Maximum running time in seconds for entire process. (default: 0)
  -maxtime-job        Maximum running time in seconds per job. (default: 0)
  -noninteractive     Disable the interactive console functionality (default: false)
  -p                  Seconds of `delay` between requests, or a range of random delay. For example "0.1" or "0.1-2.0"
  -rate               Rate of requests per second (default: 0)
  -s                  Do not print additional information (silent mode) (default: false)
  -sa                 Stop on all error cases. Implies -sf and -se. (default: false)
  -scraperfile        Custom scraper file path
  -scrapers           Active scraper groups (default: all)
  -se                 Stop on spurious errors (default: false)
  -search             Search for a FFUFHASH payload from ffuf history
  -sf                 Stop when > 95% of responses return 403 Forbidden (default: false)
  -t                  Number of concurrent threads. (default: 40)
  -v                  Verbose output, printing full URL and redirect location (if any) with the results. (default: false)

MATCHER OPTIONS:
  -mc                 Match HTTP status codes, or "all" for everything. (default: 200-299,301,302,307,401,403,405,500)
  -ml                 Match amount of lines in response
  -mmode              Matcher set operator. Either of: and, or (default: or)
  -mr                 Match regexp
  -ms                 Match HTTP response size
  -mt                 Match how many milliseconds to the first response byte, either greater or less than. EG: >100 or <100
  -mw                 Match amount of words in response

FILTER OPTIONS:
  -fc                 Filter HTTP status codes from response. Comma separated list of codes and ranges
  -fl                 Filter by amount of lines in response. Comma separated list of line counts and ranges
  -fmode              Filter set operator. Either of: and, or (default: or)
  -fr                 Filter regexp
  -fs                 Filter HTTP response size. Comma separated list of sizes and ranges
  -ft                 Filter by number of milliseconds to the first response byte, either greater or less than. EG: >100 or <100
  -fw                 Filter by amount of words in response. Comma separated list of word counts and ranges

INPUT OPTIONS:
  -D                  DirSearch wordlist compatibility mode. Used in conjunction with -e flag. (default: false)
  -e                  Comma separated list of extensions. Extends FUZZ keyword.
  -enc                Encoders for keywords, eg. 'FUZZ:urlencode b64encode'
  -ic                 Ignore wordlist comments (default: false)
  -input-cmd          Command producing the input. --input-num is required when using this input method. Overrides -w.
  -input-num          Number of inputs to test. Used in conjunction with --input-cmd. (default: 100)
  -input-shell        Shell to be used for running command
  -mode               Multi-wordlist operation mode. Available modes: clusterbomb, pitchfork, sniper (default: clusterbomb)
  -request            File containing the raw http request
  -request-proto      Protocol to use along with raw request (default: https)
  -w                  Wordlist file path and (optional) keyword separated by colon. eg. '/path/to/wordlist:KEYWORD'

OUTPUT OPTIONS:
  -debug-log          Write all of the internal logging to the specified file.
  -o                  Write output to file
  -od                 Directory path to store matched results to.
  -of                 Output file format. Available formats: json, ejson, html, md, csv, ecsv (or, 'all' for all formats) (default: json)
  -or                 Don't create the output file if we don't have results (default: false)

EXAMPLE USAGE:
  Fuzz file paths from wordlist.txt, match all responses but filter out those with content-size 42.
  Colored, verbose output.
    ffuf -w wordlist.txt -u https://example.org/FUZZ -mc all -fs 42 -c -v

  Fuzz Host-header, match HTTP 200 responses.
    ffuf -w hosts.txt -u https://example.org/ -H "Host: FUZZ" -mc 200

  Fuzz POST JSON data. Match all responses not containing text "error".
    ffuf -w entries.txt -u https://example.org/ -X POST -H "Content-Type: application/json" \
      -d '{"name": "FUZZ", "anotherkey": "anothervalue"}' -fr "error"

  Fuzz multiple locations. Match only responses reflecting the value of "VAL" keyword. Colored.
    ffuf -w params.txt:PARAM -w values.txt:VAL -u https://example.org/?PARAM=VAL -mr "VAL" -c

  More information and examples: https://github.com/ffuf/ffuf

┌──(kali㉿kali)-[~]
└─$ ffuf -u http://buyawp.gg/FUZZ -w /usr/share/wordlists/dirb/common.txt -mc 200,204,301,302,307,401,403 -r

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://buyawp.gg/FUZZ
 :: Wordlist         : FUZZ: /usr/share/wordlists/dirb/common.txt
 :: Follow redirects : true
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403
________________________________________________

:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er                        [Status: 200, Size: 17437, Words: 833, Lines: 1, Duration: 104ms]
:: Progress: [41/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [54/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [88/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [130/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [170/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [212/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [247/4614] :: Job [1/1] :: 310 req/sec :: Duration: [0:00:01] :::: Progress: [283/4614] :: Job [1/1] :: 321 req/sec :: Duration: [0:00:01] :::: Progress: [324/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:01] :::: Progress: [367/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:01] :::: Progress: [407/4614] :: Job [1/1] :: 316 req/sec :: Duration: [0:00:01] :::: Progress: [454/4614] :: Job [1/1] :: 330 req/sec :: Duration: [0:00:01] :::: Progress: [494/4614] :: Job [1/1] :: 336 req/sec :: Duration: [0:00:01] :::: Progress: [535/4614] :: Job [1/1] :: 332 req/sec :: Duration: [0:00:01] :::: Progress: [574/4614] :: Job [1/1] :: 331 req/sec :: Duration: [0:00:02] :::: Progress: [611/4614] :: Job [1/1] :: 321 req/sec :: Duration: [0:00:02] :::: Progress: [647/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:02] :::: Progress: [684/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:02] :::: Progress: [719/4614] :: Job [1/1] :: 301 req/sec :: Duration: [0:00:02] :::: Progress: [760/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:02] :::: Progress: [798/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:02] :::: Progress: [835/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:02] :::: Progress: [875/4614] :: Job [1/1] :: 307 req/sec :: Duration: [0:00:03] :::: Progress: [916/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:03] :::: Progress: [955/4614] :: Job [1/1] :: 317 req/sec :: Duration: [0:00:03] :::: Progress: [995/4614] :: Job [1/1] :: 315 req/sec :: Duration: [0:00:03] :::: Progress: [1032/4614] :: Job [1/1] :: 311 req/sec :: Duration: [0:00:03] ::: Progress: [1073/4614] :: Job [1/1] :: 313 req/sec :: Duration: [0:00:03] ::: Progress: [1115/4614] :: Job [1/1] :: 314 req/sec :: Duration: [0:00:03] ::: Progress: [1150/4614] :: Job [1/1] :: 306 req/sec :: Duration: [0:00:03] ::: Progress: [1190/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:04] ::: Progress: [1229/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:04] ::: Progress: [1265/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:04] ::: Progress: [1305/4614] :: Job [1/1] :: 305 req/sec :: Duration: [0:00:04] ::: Progress: [1349/4614] :: Job [1/1] :: 316 req/sec :: Duration: [0:00:04] ::: Progress: [1389/4614] :: Job [1/1] :: 317 req/sec :: Duration: [0:00:04] ::: Progress: [1424/4614] :: Job [1/1] :: 313 req/sec :: Duration: [0:00:04] ::: Progress: [1459/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:04] ::: Progress: [1500/4614] :: Job [1/1] :: 311 req/sec :: Duration: [0:00:05] ::: Progress: [1537/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:05] ::: Progress: [1574/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:05] ::: Progress: [1611/4614] :: Job [1/1] :: 295 req/sec :: Duration: [0:00:05] ::: Progress: [1647/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:05] ::: Progress: [1662/4614] :: Job [1/1] :: 292 req/sec :: Duration: [0:00:05] ::: Progress: [1671/4614] :: Job [1/1] :: 240 req/sec :: Duration: [0:00:05] ::: Progress: [1684/4614] :: Job [1/1] :: 212 req/sec :: Duration: [0:00:05] ::: Progress: [1719/4614] :: Job [1/1] :: 209 req/sec :: Duration: [0:00:06] ::: Progress: [1778/4614] :: Job [1/1] :: 230 req/sec :: Duration: [0:00:06] ::: Progress: [1820/4614] :: Job [1/1] :: 237 req/sec :: Duration: [0:00:06] ::: Progress: [1859/4614] :: Job [1/1] :: 242 req/sec :: Duration: [0:00:06] ::: Progress: [1896/4614] :: Job [1/1] :: 359 req/sec :: Duration: [0:00:06] ::: Progress: [1927/4614] :: Job [1/1] :: 327 req/sec :: Duration: [0:00:06] ::: Progress: [1966/4614] :: Job [1/1] :: 305 req/sec :: Duration: [0:00:06] :guide                   [Status: 200, Size: 12942, Words: 447, Lines: 1, Duration: 414ms]
:: Progress: [1976/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:06] ::: Progress: [2005/4614] :: Job [1/1] :: 297 req/sec :: Duration: [0:00:06] ::: Progress: [2041/4614] :: Job [1/1] :: 283 req/sec :: Duration: [0:00:07] :index                   [Status: 200, Size: 17437, Words: 833, Lines: 1, Duration: 70ms]
:: Progress: [2051/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:07] :index.html              [Status: 200, Size: 17437, Words: 833, Lines: 1, Duration: 77ms]
:: Progress: [2056/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:07] ::: Progress: [2079/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:07] ::: Progress: [2106/4614] :: Job [1/1] :: 275 req/sec :: Duration: [0:00:07] ::: Progress: [2136/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:07] ::: Progress: [2176/4614] :: Job [1/1] :: 273 req/sec :: Duration: [0:00:07] ::: Progress: [2211/4614] :: Job [1/1] :: 268 req/sec :: Duration: [0:00:07] ::: Progress: [2247/4614] :: Job [1/1] :: 275 req/sec :: Duration: [0:00:07] ::: Progress: [2285/4614] :: Job [1/1] :: 271 req/sec :: Duration: [0:00:07] ::: Progress: [2322/4614] :: Job [1/1] :: 279 req/sec :: Duration: [0:00:08] ::: Progress: [2361/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:08] ::: Progress: [2396/4614] :: Job [1/1] :: 288 req/sec :: Duration: [0:00:08] ::: Progress: [2431/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:08] ::: Progress: [2466/4614] :: Job [1/1] :: 290 req/sec :: Duration: [0:00:08] ::: Progress: [2502/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:08] ::: Progress: [2534/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:08] ::: Progress: [2571/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:08] ::: Progress: [2618/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:09] ::: Progress: [2657/4614] :: Job [1/1] :: 310 req/sec :: Duration: [0:00:09] ::: Progress: [2694/4614] :: Job [1/1] :: 313 req/sec :: Duration: [0:00:09] ::: Progress: [2730/4614] :: Job [1/1] :: 311 req/sec :: Duration: [0:00:09] ::: Progress: [2771/4614] :: Job [1/1] :: 326 req/sec :: Duration: [0:00:09] ::: Progress: [2807/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:09] ::: Progress: [2841/4614] :: Job [1/1] :: 306 req/sec :: Duration: [0:00:09] ::: Progress: [2877/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:09] ::: Progress: [2917/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:10] ::: Progress: [2956/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:10] ::: Progress: [2986/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:10] ::: Progress: [3023/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:10] ::: Progress: [3059/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:10] ::: Progress: [3090/4614] :: Job [1/1] :: 288 req/sec :: Duration: [0:00:10] ::: Progress: [3121/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:10] ::: Progress: [3155/4614] :: Job [1/1] :: 264 req/sec :: Duration: [0:00:10] ::: Progress: [3189/4614] :: Job [1/1] :: 272 req/sec :: Duration: [0:00:11] ::: Progress: [3227/4614] :: Job [1/1] :: 273 req/sec :: Duration: [0:00:11] ::: Progress: [3262/4614] :: Job [1/1] :: 271 req/sec :: Duration: [0:00:11] ::: Progress: [3290/4614] :: Job [1/1] :: 269 req/sec :: Duration: [0:00:11] ::: Progress: [3321/4614] :: Job [1/1] :: 270 req/sec :: Duration: [0:00:11] ::: Progress: [3360/4614] :: Job [1/1] :: 273 req/sec :: Duration: [0:00:11] ::: Progress: [3391/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:11] ::: Progress: [3420/4614] :: Job [1/1] :: 259 req/sec :: Duration: [0:00:12] ::: Progress: [3433/4614] :: Job [1/1] :: 233 req/sec :: Duration: [0:00:12] ::: Progress: [3476/4614] :: Job [1/1] :: 242 req/sec :: Duration: [0:00:12] ::: Progress: [3503/4614] :: Job [1/1] :: 243 req/sec :: Duration: [0:00:12] ::: Progress: [3534/4614] :: Job [1/1] :: 237 req/sec :: Duration: [0:00:12] ::: Progress: [3558/4614] :: Job [1/1] :: 227 req/sec :: Duration: [0:00:12] ::: Progress: [3571/4614] :: Job [1/1] :: 211 req/sec :: Duration: [0:00:12] ::: Progress: [3582/4614] :: Job [1/1] :: 192 req/sec :: Duration: [0:00:12] ::: Progress: [3611/4614] :: Job [1/1] :: 193 req/sec :: Duration: [0:00:13] ::: Progress: [3643/4614] :: Job [1/1] :: 209 req/sec :: Duration: [0:00:13] ::: Progress: [3670/4614] :: Job [1/1] :: 201 req/sec :: Duration: [0:00:13] ::: Progress: [3686/4614] :: Job [1/1] :: 182 req/sec :: Duration: [0:00:13] ::: Progress: [3732/4614] :: Job [1/1] :: 196 req/sec :: Duration: [0:00:13] :sitemap.xml             [Status: 200, Size: 187, Words: 4, Lines: 4, Duration: 173ms]
:: Progress: [3743/4614] :: Job [1/1] :: 194 req/sec :: Duration: [0:00:13] ::: Progress: [3747/4614] :: Job [1/1] :: 193 req/sec :: Duration: [0:00:13] ::: Progress: [3767/4614] :: Job [1/1] :: 186 req/sec :: Duration: [0:00:13] ::: Progress: [3814/4614] :: Job [1/1] :: 236 req/sec :: Duration: [0:00:13] ::: Progress: [3831/4614] :: Job [1/1] :: 210 req/sec :: Duration: [0:00:14] ::: Progress: [3845/4614] :: Job [1/1] :: 201 req/sec :: Duration: [0:00:14] ::: Progress: [3888/4614] :: Job [1/1] :: 230 req/sec :: Duration: [0:00:14] ::: Progress: [3922/4614] :: Job [1/1] :: 222 req/sec :: Duration: [0:00:14] ::: Progress: [3956/4614] :: Job [1/1] :: 259 req/sec :: Duration: [0:00:14] ::: Progress: [3999/4614] :: Job [1/1] :: 257 req/sec :: Duration: [0:00:14] ::: Progress: [4033/4614] :: Job [1/1] :: 272 req/sec :: Duration: [0:00:14] ::: Progress: [4067/4614] :: Job [1/1] :: 292 req/sec :: Duration: [0:00:14] ::: Progress: [4101/4614] :: Job [1/1] :: 282 req/sec :: Duration: [0:00:15] ::: Progress: [4139/4614] :: Job [1/1] :: 291 req/sec :: Duration: [0:00:15] ::: Progress: [4175/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:15] ::: Progress: [4212/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:15] ::: Progress: [4249/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:15] ::: Progress: [4286/4614] :: Job [1/1] :: 291 req/sec :: Duration: [0:00:15] ::: Progress: [4314/4614] :: Job [1/1] :: 288 req/sec :: Duration: [0:00:15] ::: Progress: [4344/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:15] ::: Progress: [4384/4614] :: Job [1/1] :: 275 req/sec :: Duration: [0:00:16] ::: Progress: [4425/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:16] ::: Progress: [4464/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:16] ::: Progress: [4506/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:16] ::: Progress: [4545/4614] :: Job [1/1] :: 329 req/sec :: Duration: [0:00:16] ::: Progress: [4579/4614] :: Job [1/1] :: 317 req/sec :: Duration: [0:00:16] ::: Progress: [4614/4614] :: Job [1/1] :: 310 req/sec :: Duration: [0:00:16] ::: Progress: [4614/4614] :: Job [1/1] :: 252 req/sec :: Duration: [0:00:17] :: Errors: 7 ::
                                                                             
┌──(kali㉿kali)-[~]
└─$ curl -s http://buyawp.gg/sitemap.xml
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>cloudflare</center>
</body>
</html>
                                                                             
┌──(kali㉿kali)-[~]
└─$ curl -s http://buyawp.gg/guide | grep -i "farmer"
                                                                             
┌──(kali㉿kali)-[~]
└─$ curl -s http://buyawp.gg | grep -i "license\|package\|farmer"
                                                                             
┌──(kali㉿kali)-[~]
└─$ ffuf -u http://buyawp.gg/FUZZ -w /usr/share/wordlists/dirb/common.txt -mc 200,204,301,302,307,401,403 -r -fs 17437

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://buyawp.gg/FUZZ
 :: Wordlist         : FUZZ: /usr/share/wordlists/dirb/common.txt
 :: Follow redirects : true
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403
 :: Filter           : Response size: 17437
________________________________________________

:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [57/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [85/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [126/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [160/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [193/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [230/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:01] :::: Progress: [261/4614] :: Job [1/1] :: 271 req/sec :: Duration: [0:00:01] :::: Progress: [298/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:01] :::: Progress: [330/4614] :: Job [1/1] :: 272 req/sec :: Duration: [0:00:01] :::: Progress: [369/4614] :: Job [1/1] :: 275 req/sec :: Duration: [0:00:01] :::: Progress: [407/4614] :: Job [1/1] :: 280 req/sec :: Duration: [0:00:01] :::: Progress: [442/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:01] :::: Progress: [474/4614] :: Job [1/1] :: 279 req/sec :: Duration: [0:00:01] :::: Progress: [506/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:02] :::: Progress: [545/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:02] :::: Progress: [582/4614] :: Job [1/1] :: 282 req/sec :: Duration: [0:00:02] :::: Progress: [621/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:02] :::: Progress: [662/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:02] :::: Progress: [701/4614] :: Job [1/1] :: 305 req/sec :: Duration: [0:00:02] :::: Progress: [743/4614] :: Job [1/1] :: 314 req/sec :: Duration: [0:00:02] :::: Progress: [779/4614] :: Job [1/1] :: 319 req/sec :: Duration: [0:00:02] :::: Progress: [818/4614] :: Job [1/1] :: 321 req/sec :: Duration: [0:00:03] :::: Progress: [860/4614] :: Job [1/1] :: 314 req/sec :: Duration: [0:00:03] :::: Progress: [897/4614] :: Job [1/1] :: 307 req/sec :: Duration: [0:00:03] :::: Progress: [932/4614] :: Job [1/1] :: 310 req/sec :: Duration: [0:00:03] :::: Progress: [969/4614] :: Job [1/1] :: 301 req/sec :: Duration: [0:00:03] :::: Progress: [1004/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:03] ::: Progress: [1045/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:03] ::: Progress: [1089/4614] :: Job [1/1] :: 311 req/sec :: Duration: [0:00:03] ::: Progress: [1135/4614] :: Job [1/1] :: 325 req/sec :: Duration: [0:00:04] ::: Progress: [1172/4614] :: Job [1/1] :: 330 req/sec :: Duration: [0:00:04] ::: Progress: [1212/4614] :: Job [1/1] :: 328 req/sec :: Duration: [0:00:04] ::: Progress: [1249/4614] :: Job [1/1] :: 322 req/sec :: Duration: [0:00:04] ::: Progress: [1286/4614] :: Job [1/1] :: 315 req/sec :: Duration: [0:00:04] ::: Progress: [1324/4614] :: Job [1/1] :: 305 req/sec :: Duration: [0:00:04] ::: Progress: [1360/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:04] ::: Progress: [1397/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:04] ::: Progress: [1434/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:05] ::: Progress: [1470/4614] :: Job [1/1] :: 293 req/sec :: Duration: [0:00:05] ::: Progress: [1506/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:05] ::: Progress: [1543/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:05] ::: Progress: [1575/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:05] ::: Progress: [1614/4614] :: Job [1/1] :: 290 req/sec :: Duration: [0:00:05] ::: Progress: [1652/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:05] ::: Progress: [1687/4614] :: Job [1/1] :: 288 req/sec :: Duration: [0:00:05] ::: Progress: [1728/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:06] ::: Progress: [1768/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:06] ::: Progress: [1808/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:06] ::: Progress: [1848/4614] :: Job [1/1] :: 304 req/sec :: Duration: [0:00:06] ::: Progress: [1883/4614] :: Job [1/1] :: 309 req/sec :: Duration: [0:00:06] :guide                   [Status: 200, Size: 12942, Words: 447, Lines: 1, Duration: 85ms]
:: Progress: [1887/4614] :: Job [1/1] :: 315 req/sec :: Duration: [0:00:06] ::: Progress: [1926/4614] :: Job [1/1] :: 315 req/sec :: Duration: [0:00:06] ::: Progress: [1960/4614] :: Job [1/1] :: 304 req/sec :: Duration: [0:00:06] ::: Progress: [1997/4614] :: Job [1/1] :: 301 req/sec :: Duration: [0:00:06] ::: Progress: [2037/4614] :: Job [1/1] :: 304 req/sec :: Duration: [0:00:07] ::: Progress: [2076/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:07] ::: Progress: [2119/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:07] ::: Progress: [2157/4614] :: Job [1/1] :: 309 req/sec :: Duration: [0:00:07] ::: Progress: [2191/4614] :: Job [1/1] :: 306 req/sec :: Duration: [0:00:07] ::: Progress: [2224/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:07] ::: Progress: [2260/4614] :: Job [1/1] :: 304 req/sec :: Duration: [0:00:07] ::: Progress: [2294/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:07] ::: Progress: [2330/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:08] ::: Progress: [2370/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:08] ::: Progress: [2409/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:08] ::: Progress: [2448/4614] :: Job [1/1] :: 306 req/sec :: Duration: [0:00:08] ::: Progress: [2483/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:08] ::: Progress: [2516/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:08] ::: Progress: [2551/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:08] ::: Progress: [2586/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:08] ::: Progress: [2622/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:09] ::: Progress: [2656/4614] :: Job [1/1] :: 279 req/sec :: Duration: [0:00:09] ::: Progress: [2692/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:09] ::: Progress: [2726/4614] :: Job [1/1] :: 282 req/sec :: Duration: [0:00:09] ::: Progress: [2760/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:09] ::: Progress: [2795/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:09] ::: Progress: [2823/4614] :: Job [1/1] :: 269 req/sec :: Duration: [0:00:09] ::: Progress: [2864/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:09] ::: Progress: [2901/4614] :: Job [1/1] :: 288 req/sec :: Duration: [0:00:10] ::: Progress: [2934/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:10] ::: Progress: [2968/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:10] ::: Progress: [3003/4614] :: Job [1/1] :: 282 req/sec :: Duration: [0:00:10] ::: Progress: [3039/4614] :: Job [1/1] :: 290 req/sec :: Duration: [0:00:10] ::: Progress: [3072/4614] :: Job [1/1] :: 275 req/sec :: Duration: [0:00:10] ::: Progress: [3106/4614] :: Job [1/1] :: 272 req/sec :: Duration: [0:00:10] ::: Progress: [3137/4614] :: Job [1/1] :: 268 req/sec :: Duration: [0:00:10] ::: Progress: [3171/4614] :: Job [1/1] :: 267 req/sec :: Duration: [0:00:11] ::: Progress: [3205/4614] :: Job [1/1] :: 271 req/sec :: Duration: [0:00:11] ::: Progress: [3238/4614] :: Job [1/1] :: 262 req/sec :: Duration: [0:00:11] ::: Progress: [3271/4614] :: Job [1/1] :: 265 req/sec :: Duration: [0:00:11] ::: Progress: [3306/4614] :: Job [1/1] :: 270 req/sec :: Duration: [0:00:11] ::: Progress: [3344/4614] :: Job [1/1] :: 278 req/sec :: Duration: [0:00:11] ::: Progress: [3381/4614] :: Job [1/1] :: 280 req/sec :: Duration: [0:00:11] ::: Progress: [3412/4614] :: Job [1/1] :: 276 req/sec :: Duration: [0:00:11] ::: Progress: [3438/4614] :: Job [1/1] :: 267 req/sec :: Duration: [0:00:12] ::: Progress: [3472/4614] :: Job [1/1] :: 269 req/sec :: Duration: [0:00:12] ::: Progress: [3504/4614] :: Job [1/1] :: 262 req/sec :: Duration: [0:00:12] ::: Progress: [3539/4614] :: Job [1/1] :: 257 req/sec :: Duration: [0:00:12] ::: Progress: [3575/4614] :: Job [1/1] :: 256 req/sec :: Duration: [0:00:12] ::: Progress: [3607/4614] :: Job [1/1] :: 257 req/sec :: Duration: [0:00:12] ::: Progress: [3644/4614] :: Job [1/1] :: 270 req/sec :: Duration: [0:00:12] ::: Progress: [3678/4614] :: Job [1/1] :: 272 req/sec :: Duration: [0:00:12] ::: Progress: [3717/4614] :: Job [1/1] :: 278 req/sec :: Duration: [0:00:13] :sitemap.xml             [Status: 200, Size: 187, Words: 4, Lines: 4, Duration: 59ms]
:: Progress: [3733/4614] :: Job [1/1] :: 280 req/sec :: Duration: [0:00:13] ::: Progress: [3752/4614] :: Job [1/1] :: 280 req/sec :: Duration: [0:00:13] ::: Progress: [3791/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:13] ::: Progress: [3824/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:13] ::: Progress: [3859/4614] :: Job [1/1] :: 288 req/sec :: Duration: [0:00:13] ::: Progress: [3895/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:13] ::: Progress: [3935/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:13] ::: Progress: [3976/4614] :: Job [1/1] :: 295 req/sec :: Duration: [0:00:14] ::: Progress: [4011/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:14] ::: Progress: [4047/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:14] ::: Progress: [4079/4614] :: Job [1/1] :: 291 req/sec :: Duration: [0:00:14] ::: Progress: [4115/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:14] ::: Progress: [4156/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:14] ::: Progress: [4190/4614] :: Job [1/1] :: 293 req/sec :: Duration: [0:00:14] ::: Progress: [4229/4614] :: Job [1/1] :: 292 req/sec :: Duration: [0:00:14] ::: Progress: [4270/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:15] ::: Progress: [4309/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:15] ::: Progress: [4346/4614] :: Job [1/1] :: 305 req/sec :: Duration: [0:00:15] ::: Progress: [4390/4614] :: Job [1/1] :: 320 req/sec :: Duration: [0:00:15] ::: Progress: [4426/4614] :: Job [1/1] :: 315 req/sec :: Duration: [0:00:15] ::: Progress: [4461/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:15] ::: Progress: [4506/4614] :: Job [1/1] :: 310 req/sec :: Duration: [0:00:15] ::: Progress: [4540/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:15] ::: Progress: [4578/4614] :: Job [1/1] :: 291 req/sec :: Duration: [0:00:16] ::: Progress: [4614/4614] :: Job [1/1] :: 307 req/sec :: Duration: [0:00:16] ::: Progress: [4614/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:16] :: Errors: 7 ::
                                                                             
┌──(kali㉿kali)-[~]
└─$ ffuf -u http://buyawp.gg/api/FUZZ -w /usr/share/wordlists/dirb/common.txt -mc 200,204,301,302,307,401,403 -r

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://buyawp.gg/api/FUZZ
 :: Wordlist         : FUZZ: /usr/share/wordlists/dirb/common.txt
 :: Follow redirects : true
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403
________________________________________________

:: Progress: [4/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Err:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [40/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [66/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Er:: Progress: [106/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [152/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [189/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [227/4614] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: E:: Progress: [264/4614] :: Job [1/1] :: 315 req/sec :: Duration: [0:00:01] :::: Progress: [306/4614] :: Job [1/1] :: 324 req/sec :: Duration: [0:00:01] :::: Progress: [336/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:01] :::: Progress: [373/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:01] :::: Progress: [408/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:01] :::: Progress: [444/4614] :: Job [1/1] :: 295 req/sec :: Duration: [0:00:01] :::: Progress: [483/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:01] :::: Progress: [523/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:01] :::: Progress: [565/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:02] :::: Progress: [606/4614] :: Job [1/1] :: 314 req/sec :: Duration: [0:00:02] :::: Progress: [648/4614] :: Job [1/1] :: 322 req/sec :: Duration: [0:00:02] :::: Progress: [689/4614] :: Job [1/1] :: 323 req/sec :: Duration: [0:00:02] :::: Progress: [730/4614] :: Job [1/1] :: 323 req/sec :: Duration: [0:00:02] :::: Progress: [767/4614] :: Job [1/1] :: 326 req/sec :: Duration: [0:00:02] :::: Progress: [806/4614] :: Job [1/1] :: 322 req/sec :: Duration: [0:00:02] :::: Progress: [841/4614] :: Job [1/1] :: 314 req/sec :: Duration: [0:00:02] :::: Progress: [878/4614] :: Job [1/1] :: 316 req/sec :: Duration: [0:00:03] :::: Progress: [921/4614] :: Job [1/1] :: 313 req/sec :: Duration: [0:00:03] :::: Progress: [956/4614] :: Job [1/1] :: 301 req/sec :: Duration: [0:00:03] :::: Progress: [990/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:03] :::: Progress: [1024/4614] :: Job [1/1] :: 292 req/sec :: Duration: [0:00:03] ::: Progress: [1067/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:03] ::: Progress: [1107/4614] :: Job [1/1] :: 301 req/sec :: Duration: [0:00:03] ::: Progress: [1150/4614] :: Job [1/1] :: 318 req/sec :: Duration: [0:00:03] ::: Progress: [1189/4614] :: Job [1/1] :: 316 req/sec :: Duration: [0:00:04] ::: Progress: [1227/4614] :: Job [1/1] :: 323 req/sec :: Duration: [0:00:04] ::: Progress: [1264/4614] :: Job [1/1] :: 322 req/sec :: Duration: [0:00:04] ::: Progress: [1306/4614] :: Job [1/1] :: 317 req/sec :: Duration: [0:00:04] ::: Progress: [1346/4614] :: Job [1/1] :: 308 req/sec :: Duration: [0:00:04] ::: Progress: [1383/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:04] ::: Progress: [1419/4614] :: Job [1/1] :: 299 req/sec :: Duration: [0:00:04] ::: Progress: [1458/4614] :: Job [1/1] :: 307 req/sec :: Duration: [0:00:04] ::: Progress: [1496/4614] :: Job [1/1] :: 307 req/sec :: Duration: [0:00:05] ::: Progress: [1537/4614] :: Job [1/1] :: 311 req/sec :: Duration: [0:00:05] ::: Progress: [1574/4614] :: Job [1/1] :: 307 req/sec :: Duration: [0:00:05] ::: Progress: [1613/4614] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:05] ::: Progress: [1653/4614] :: Job [1/1] :: 309 req/sec :: Duration: [0:00:05] ::: Progress: [1684/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:05] ::: Progress: [1723/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:05] ::: Progress: [1758/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:05] ::: Progress: [1795/4614] :: Job [1/1] :: 292 req/sec :: Duration: [0:00:06] ::: Progress: [1829/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:06] ::: Progress: [1860/4614] :: Job [1/1] :: 269 req/sec :: Duration: [0:00:06] ::: Progress: [1898/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:06] ::: Progress: [1935/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:06] ::: Progress: [1971/4614] :: Job [1/1] :: 283 req/sec :: Duration: [0:00:06] ::: Progress: [2006/4614] :: Job [1/1] :: 279 req/sec :: Duration: [0:00:06] ::: Progress: [2042/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:06] ::: Progress: [2076/4614] :: Job [1/1] :: 285 req/sec :: Duration: [0:00:07] ::: Progress: [2113/4614] :: Job [1/1] :: 283 req/sec :: Duration: [0:00:07] ::: Progress: [2150/4614] :: Job [1/1] :: 283 req/sec :: Duration: [0:00:07] ::: Progress: [2186/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:07] ::: Progress: [2221/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:07] ::: Progress: [2258/4614] :: Job [1/1] :: 288 req/sec :: Duration: [0:00:07] ::: Progress: [2289/4614] :: Job [1/1] :: 286 req/sec :: Duration: [0:00:07] ::: Progress: [2328/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:07] ::: Progress: [2366/4614] :: Job [1/1] :: 284 req/sec :: Duration: [0:00:08] ::: Progress: [2398/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:08] ::: Progress: [2428/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:08] ::: Progress: [2467/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:08] ::: Progress: [2501/4614] :: Job [1/1] :: 282 req/sec :: Duration: [0:00:08] ::: Progress: [2539/4614] :: Job [1/1] :: 282 req/sec :: Duration: [0:00:08] ::: Progress: [2577/4614] :: Job [1/1] :: 291 req/sec :: Duration: [0:00:08] ::: Progress: [2608/4614] :: Job [1/1] :: 281 req/sec :: Duration: [0:00:08] ::: Progress: [2639/4614] :: Job [1/1] :: 279 req/sec :: Duration: [0:00:09] ::: Progress: [2675/4614] :: Job [1/1] :: 280 req/sec :: Duration: [0:00:09] ::: Progress: [2710/4614] :: Job [1/1] :: 277 req/sec :: Duration: [0:00:09] ::: Progress: [2747/4614] :: Job [1/1] :: 274 req/sec :: Duration: [0:00:09] ::: Progress: [2780/4614] :: Job [1/1] :: 272 req/sec :: Duration: [0:00:09] ::: Progress: [2814/4614] :: Job [1/1] :: 279 req/sec :: Duration: [0:00:09] ::: Progress: [2849/4614] :: Job [1/1] :: 280 req/sec :: Duration: [0:00:09] ::: Progress: [2883/4614] :: Job [1/1] :: 278 req/sec :: Duration: [0:00:09] ::: Progress: [2916/4614] :: Job [1/1] :: 272 req/sec :: Duration: [0:00:10] ::: Progress: [2951/4614] :: Job [1/1] :: 271 req/sec :: Duration: [0:00:10] ::: Progress: [2989/4614] :: Job [1/1] :: 279 req/sec :: Duration: [0:00:10] ::: Progress: [3024/4614] :: Job [1/1] :: 280 req/sec :: Duration: [0:00:10] ::: Progress: [3061/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:10] ::: Progress: [3106/4614] :: Job [1/1] :: 308 req/sec :: Duration: [0:00:10] ::: Progress: [3143/4614] :: Job [1/1] :: 306 req/sec :: Duration: [0:00:10] ::: Progress: [3180/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:10] ::: Progress: [3214/4614] :: Job [1/1] :: 300 req/sec :: Duration: [0:00:11] ::: Progress: [3252/4614] :: Job [1/1] :: 307 req/sec :: Duration: [0:00:11] ::: Progress: [3289/4614] :: Job [1/1] :: 304 req/sec :: Duration: [0:00:11] ::: Progress: [3329/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:11] ::: Progress: [3370/4614] :: Job [1/1] :: 306 req/sec :: Duration: [0:00:11] ::: Progress: [3410/4614] :: Job [1/1] :: 315 req/sec :: Duration: [0:00:11] ::: Progress: [3454/4614] :: Job [1/1] :: 325 req/sec :: Duration: [0:00:11] ::: Progress: [3495/4614] :: Job [1/1] :: 335 req/sec :: Duration: [0:00:11] ::: Progress: [3533/4614] :: Job [1/1] :: 325 req/sec :: Duration: [0:00:12] ::: Progress: [3570/4614] :: Job [1/1] :: 321 req/sec :: Duration: [0:00:12] ::: Progress: [3606/4614] :: Job [1/1] :: 313 req/sec :: Duration: [0:00:12] ::: Progress: [3647/4614] :: Job [1/1] :: 310 req/sec :: Duration: [0:00:12] ::: Progress: [3688/4614] :: Job [1/1] :: 308 req/sec :: Duration: [0:00:12] ::: Progress: [3725/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:12] ::: Progress: [3756/4614] :: Job [1/1] :: 292 req/sec :: Duration: [0:00:12] ::: Progress: [3795/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:12] ::: Progress: [3831/4614] :: Job [1/1] :: 292 req/sec :: Duration: [0:00:13] ::: Progress: [3875/4614] :: Job [1/1] :: 296 req/sec :: Duration: [0:00:13] ::: Progress: [3911/4614] :: Job [1/1] :: 298 req/sec :: Duration: [0:00:13] ::: Progress: [3951/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:13] ::: Progress: [3992/4614] :: Job [1/1] :: 311 req/sec :: Duration: [0:00:13] ::: Progress: [4021/4614] :: Job [1/1] :: 295 req/sec :: Duration: [0:00:13] ::: Progress: [4055/4614] :: Job [1/1] :: 291 req/sec :: Duration: [0:00:13] ::: Progress: [4094/4614] :: Job [1/1] :: 294 req/sec :: Duration: [0:00:13] ::: Progress: [4129/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:14] ::: Progress: [4168/4614] :: Job [1/1] :: 289 req/sec :: Duration: [0:00:14] ::: Progress: [4205/4614] :: Job [1/1] :: 287 req/sec :: Duration: [0:00:14] ::: Progress: [4240/4614] :: Job [1/1] :: 297 req/sec :: Duration: [0:00:14] ::: Progress: [4281/4614] :: Job [1/1] :: 297 req/sec :: Duration: [0:00:14] ::: Progress: [4317/4614] :: Job [1/1] :: 297 req/sec :: Duration: [0:00:14] ::: Progress: [4358/4614] :: Job [1/1] :: 303 req/sec :: Duration: [0:00:14] ::: Progress: [4393/4614] :: Job [1/1] :: 301 req/sec :: Duration: [0:00:14] ::: Progress: [4432/4614] :: Job [1/1] :: 309 req/sec :: Duration: [0:00:15] ::: Progress: [4471/4614] :: Job [1/1] :: 305 req/sec :: Duration: [0:00:15] ::: Progress: [4504/4614] :: Job [1/1] :: 302 req/sec :: Duration: [0:00:15] ::: Progress: [4537/4614] :: Job [1/1] :: 293 req/sec :: Duration: [0:00:15] ::: Progress: [4571/4614] :: Job [1/1] :: 291 req/sec :: Duration: [0:00:15] ::: Progress: [4610/4614] :: Job [1/1] :: 297 req/sec :: Duration: [0:00:15] ::: Progress: [4614/4614] :: Job [1/1] :: 295 req/sec :: Duration: [0:00:15] ::: Progress: [4614/4614] :: Job [1/1] :: 232 req/sec :: Duration: [0:00:16] :: Errors: 7 ::
                                                                             
┌──(kali㉿kali)-[~]
└─$ ffuf -u http://buyawp.gg/FUZZ -w /usr/share/wordlists/seclists/Discovery/Web-Content/api-endpoints-res.txt -mc 200,204,301,302,307,401,403 -r
Encountered error(s): 1 errors occurred.
        * stat /usr/share/wordlists/seclists/Discovery/Web-Content/api-endpoints-res.txt: no such file or directory

Fuzz Faster U Fool - v2.1.0-dev

HTTP OPTIONS:
  -H                  Header `"Name: Value"`, separated by colon. Multiple -H flags are accepted.
  -X                  HTTP method to use
  -b                  Cookie data `"NAME1=VALUE1; NAME2=VALUE2"` for copy as curl functionality.
  -cc                 Client cert for authentication. Client key needs to be defined as well for this to work
  -ck                 Client key for authentication. Client certificate needs to be defined as well for this to work
  -d                  POST data
  -http2              Use HTTP2 protocol (default: false)
  -ignore-body        Do not fetch the response content. (default: false)
  -r                  Follow redirects (default: false)
  -raw                Do not encode URI (default: false)
  -recursion          Scan recursively. Only FUZZ keyword is supported, and URL (-u) has to end in it. (default: false)
  -recursion-depth    Maximum recursion depth. (default: 0)
  -recursion-strategy Recursion strategy: "default" for a redirect based, and "greedy" to recurse on all matches (default: default)
  -replay-proxy       Replay matched requests using this proxy.
  -sni                Target TLS SNI, does not support FUZZ keyword
  -timeout            HTTP request timeout in seconds. (default: 10)
  -u                  Target URL
  -x                  Proxy URL (SOCKS5 or HTTP). For example: http://127.0.0.1:8080 or socks5://127.0.0.1:8080

GENERAL OPTIONS:
  -V                  Show version information. (default: false)
  -ac                 Automatically calibrate filtering options (default: false)
  -acc                Custom auto-calibration string. Can be used multiple times. Implies -ac
  -ach                Per host autocalibration (default: false)
  -ack                Autocalibration keyword (default: FUZZ)
  -acs                Custom auto-calibration strategies. Can be used multiple times. Implies -ac
  -c                  Colorize output. (default: false)
  -config             Load configuration from a file
  -json               JSON output, printing newline-delimited JSON records (default: false)
  -maxtime            Maximum running time in seconds for entire process. (default: 0)
  -maxtime-job        Maximum running time in seconds per job. (default: 0)
  -noninteractive     Disable the interactive console functionality (default: false)
  -p                  Seconds of `delay` between requests, or a range of random delay. For example "0.1" or "0.1-2.0"
  -rate               Rate of requests per second (default: 0)
  -s                  Do not print additional information (silent mode) (default: false)
  -sa                 Stop on all error cases. Implies -sf and -se. (default: false)
  -scraperfile        Custom scraper file path
  -scrapers           Active scraper groups (default: all)
  -se                 Stop on spurious errors (default: false)
  -search             Search for a FFUFHASH payload from ffuf history
  -sf                 Stop when > 95% of responses return 403 Forbidden (default: false)
  -t                  Number of concurrent threads. (default: 40)
  -v                  Verbose output, printing full URL and redirect location (if any) with the results. (default: false)

MATCHER OPTIONS:
  -mc                 Match HTTP status codes, or "all" for everything. (default: 200-299,301,302,307,401,403,405,500)
  -ml                 Match amount of lines in response
  -mmode              Matcher set operator. Either of: and, or (default: or)
  -mr                 Match regexp
  -ms                 Match HTTP response size
  -mt                 Match how many milliseconds to the first response byte, either greater or less than. EG: >100 or <100
  -mw                 Match amount of words in response

FILTER OPTIONS:
  -fc                 Filter HTTP status codes from response. Comma separated list of codes and ranges
  -fl                 Filter by amount of lines in response. Comma separated list of line counts and ranges
  -fmode              Filter set operator. Either of: and, or (default: or)
  -fr                 Filter regexp
  -fs                 Filter HTTP response size. Comma separated list of sizes and ranges
  -ft                 Filter by number of milliseconds to the first response byte, either greater or less than. EG: >100 or <100
  -fw                 Filter by amount of words in response. Comma separated list of word counts and ranges

INPUT OPTIONS:
  -D                  DirSearch wordlist compatibility mode. Used in conjunction with -e flag. (default: false)
  -e                  Comma separated list of extensions. Extends FUZZ keyword.
  -enc                Encoders for keywords, eg. 'FUZZ:urlencode b64encode'
  -ic                 Ignore wordlist comments (default: false)
  -input-cmd          Command producing the input. --input-num is required when using this input method. Overrides -w.
  -input-num          Number of inputs to test. Used in conjunction with --input-cmd. (default: 100)
  -input-shell        Shell to be used for running command
  -mode               Multi-wordlist operation mode. Available modes: clusterbomb, pitchfork, sniper (default: clusterbomb)
  -request            File containing the raw http request
  -request-proto      Protocol to use along with raw request (default: https)
  -w                  Wordlist file path and (optional) keyword separated by colon. eg. '/path/to/wordlist:KEYWORD'

OUTPUT OPTIONS:
  -debug-log          Write all of the internal logging to the specified file.
  -o                  Write output to file
  -od                 Directory path to store matched results to.
  -of                 Output file format. Available formats: json, ejson, html, md, csv, ecsv (or, 'all' for all formats) (default: json)
  -or                 Don't create the output file if we don't have results (default: false)

EXAMPLE USAGE:
  Fuzz file paths from wordlist.txt, match all responses but filter out those with content-size 42.
  Colored, verbose output.
    ffuf -w wordlist.txt -u https://example.org/FUZZ -mc all -fs 42 -c -v

  Fuzz Host-header, match HTTP 200 responses.
    ffuf -w hosts.txt -u https://example.org/ -H "Host: FUZZ" -mc 200

  Fuzz POST JSON data. Match all responses not containing text "error".
    ffuf -w entries.txt -u https://example.org/ -X POST -H "Content-Type: application/json" \
      -d '{"name": "FUZZ", "anotherkey": "anothervalue"}' -fr "error"

  Fuzz multiple locations. Match only responses reflecting the value of "VAL" keyword. Colored.
    ffuf -w params.txt:PARAM -w values.txt:VAL -u https://example.org/?PARAM=VAL -mr "VAL" -c

  More information and examples: https://github.com/ffuf/ffuf

Encountered error(s): 1 errors occurred.
        * stat /usr/share/wordlists/seclists/Discovery/Web-Content/api-endpoints-res.txt: no such file or directory

                                                                             
┌──(kali㉿kali)-[~]
└─$ 

