(:
 : Copyright 2011 - Gary Vidal
 :
 : Licensed     under the Apache License, Version 2.0 (the "License");
 : you may not use this file except in compliance with the License.
 : You may obtain a copy of the License at
 :
 :    http://www.apache.org/licenses/LICENSE-2.0
 :
 : Unless required by applicable law or agreed to in writing, software
 : distributed under the License is distributed on an "AS IS" BASIS,
 : WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 : See the License for the specific language governing permissions and
 : limitations under the License.
 :)



xquery version "1.0-ml";

module namespace config = "http://www.xquerrail-framework.com/config";

import module namespace response = "http://www.xquerrail-framework.com/response"
   at "/_framework/response.xqy";
import module namespace request  = "http://www.xquerrail-framework.com/request"
   at "/_framework/request.xqy";

declare variable $CONFIG := xdmp:invoke("/_config/config.xml");
declare variable $DEFAULT-ENGINE := "engine.html";
declare variable $ENGINE-PATH := "/_framework/engines";

declare function config:get-controller()
{
   fn:string($CONFIG/config:controller/@resource)
};
declare function config:get-engine($response as map:map)
{
   let $_ := response:set-response($response)
   return
     if(response:format() eq "html") 
     then "engine.html"
     else if(response:format() eq "xml")
     then "engine.xml"
     else if(response:format() eq "json")
     then "engine.json"
     else $DEFAULT-ENGINE
     
};