#!/usr/bin/env python

import sys
import pygtk
pygtk.require("2.0")
import gtk
import gtk.glade
import commands
import os
import gettext
from user import home
import webkit
import string

# i18n
gettext.install("xswelcome", "/usr/share/ututo/locale")


class MintWelcome():
    def __init__(self):
        gladefile = "/usr/lib/ututo/xsWelcome/xsWelcome.glade"
        wTree = gtk.glade.XML(gladefile,"main_window")
        wTree.get_widget("main_window").set_title(_("Welcome to Ututo XS"))
        wTree.get_widget("main_window").set_icon_from_file("/usr/lib/ututo/xsWelcome/ututo.png")

        sys.path.append('/usr/lib/ututo/common')
        from configobj import ConfigObj
        config = ConfigObj("/etc/ututo/info")
        description = config['DESCRIPTION']
        codename = config['CODENAME']
        edition = config['EDITION']
        release = config['RELEASE']
        description = description.replace("\"", "")
        self.release_notes = config['RELEASE_NOTES_URL']
        self.user_guide = config['USER_GUIDE_URL']
        self.new_features = config['NEW_FEATURES_URL']

        wTree.get_widget("main_window").connect("destroy", gtk.main_quit)

        browser = webkit.WebView()
        wTree.get_widget("scrolled_welcome").add(browser)
        browser.connect("button-press-event", lambda w, e: e.button == 3)
        subs = {}
        subs['release'] = release + " (" + codename + ")"
        subs['edition'] = edition
        subs['title'] = _("Welcome to Ututo XS")
        subs['release_title'] = _("Release")
        subs['edition_title'] = _("Edition")
        subs['site_title'] = _("Project")
        subs['user_guide_title'] = _("Documentation")
        subs['support_title'] = _("Support")
        subs['news_title'] = _("Community")
        subs['project'] = _("Web Site")
        subs['user_guide'] = _("User Guide")
        subs['forums'] = _("Forums")
        subs['news'] = _("News")
        subs['project_title'] = _("UTUTO Project")

            
        subs['show'] = _("Show this dialog at startup")
        subs['close'] = _("Close")
        if os.path.exists("norun.flag"):
            subs['checked'] = ("")
        else:
            subs['checked'] = ("CHECKED")

        subs['welcome'] = _("Welcome and thank you for choosing Ututo XS. We hope you'll enjoy using it as much as we did designing it. The links below will help you get started with your new operating system. Have a great time and don't hesitate to send us your feedback.")
        subs['licence']= _("This GNU System is entirely made with only free software from source code.<br/>Copying, modification and redistribution of this entire GNU System are permitted provided this notice is preserved.<br/>")
        subs['author']= _("Developed by UTUTO Development Team<br/>(C) UTUTO Project")        
        template = open("/usr/lib/ututo/xsWelcome/templates/welcome.html").read()
        html = string.Template(template).safe_substitute(subs)
        browser.load_html_string(html, "file:/")
        browser.connect('title-changed', self.title_changed)
        wTree.get_widget("main_window").show_all()

    def title_changed(self, view, frame, title):
        if title.startswith("nop"):
            return
        # call directive looks like:
        #  "call:func:arg1,arg2"
        #  "call:func"
        elif title == "event_site":
            os.system("xdg-open http://www.ututo.org")
        elif title == "event_user_guide":
            os.system("xdg-open http://www.ututo.org/cmsd/content/manual-ututo-xs")
        elif title == "event_forums":
            os.system("xdg-open http://www.ututo.org/cmsd/forum")
        elif title == "event_news":
            os.system("xdg-open http://proyecto.ututo.net/cmsd/noticias")         
        elif title == "event_close_true":
            if os.path.exists(home + "/.ututoxs/xsWelcome/norun.flag"):
                os.system("rm -rf " + home + "/.ututoxs/xsWelcome/norun.flag")
            gtk.main_quit()
        elif title == "event_close_false":
            os.system("mkdir -p " + home + "/.ututoxs/xsWelcome")
            os.system("touch " + home + "/.ututoxs/xsWelcome/norun.flag")
            gtk.main_quit()
        elif title == "checkbox_checked":
            if os.path.exists(home + "/.ututoxs/xsWelcome/norun.flag"):
                os.system("rm -rf " + home + "/.ututoxs/xsWelcome/norun.flag")
        elif title == "checkbox_unchecked":
            os.system("mkdir -p " + home + "/.ututoxs/xsWelcome")
            os.system("touch " + home + "/.ututoxs/xsWelcome/norun.flag")


if __name__ == "__main__":
    MintWelcome()
    gtk.main()
