package com.example

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/auth/index")
        "/register"(view: "/auth/register")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "/menu"(view:"/main/menu")
    }
}
