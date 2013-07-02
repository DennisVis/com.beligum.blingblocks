package com.beligum.blingblocks.controllers;

import play.mvc.Controller;
import play.mvc.Result;

public class Application extends Controller
{
    public static Result index(String urlName)
    {
	return com.beligum.cms.controllers.pages.PageController.show(urlName);
    }
}
