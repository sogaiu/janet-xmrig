(import http)

(defn summary
  "Get summary as a json string. addr shouldn't contain a trailing slash."
  [addr access-token]
  (get (http/get (string addr "/2/summary")
                 :headers {"Authorization" (string "Bearer " access-token)})
       :body))

(defn backends
  ``
  Get backend information as a json string.
  addr shouldn't contain a trailing slash.
  ``
  [addr access-token]
  (get (http/get (string addr "/2/backends")
                 :headers {"Authorization" (string "Bearer " access-token)})
       :body))

(defn get-config
  ``
  Get config information as a json string.
  addr shouldn't contain a trailing slash.
  ``
  [addr access-token]
  (get (http/get (string addr "/2/config")
                 :headers {"Authorization" (string "Bearer " access-token)})
       :body))

(defn set-config
  "Set config with a json string. addr shouldn't contain a trailing slash."
  [addr access-token json-config-str]
  (get (http/put (string addr "/2/config") json-config-str
                 :headers {"Authorization" (string "Bearer " access-token)
                           "Content-Type" "application/json"})
       :body))

(defn pause
  "Pause xmrig. addr shouldn't contain a trailing slash."
  [addr access-token]
  (get (http/post (string addr "/json_rpc") "{\"method\": \"pause\"}"
                  :headers {"Authorization" (string "Bearer " access-token)
                            "Content-Type" "application/json"})
       :body))

(defn resume
  "Resume xmrig. addr shouldn't contain a trailing slash."
  [addr access-token]
  (get (http/post (string addr "/json_rpc") "{\"method\": \"resume\"}"
                  :headers {"Authorization" (string "Bearer " access-token)
                            "Content-Type" "application/json"})
       :body))

(defn stop
  ```
  Stop xmrig. Resume is not possible after stop.
  addr shouldn't contain a trailing slash.
  ```
  [addr access-token]
  (get (http/post (string addr "/json_rpc") "{\"method\": \"stop\"}"
                  :headers {"Authorization" (string "Bearer " access-token)
                            "Content-Type" "application/json"})
       :body))
