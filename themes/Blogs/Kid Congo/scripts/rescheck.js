wraphandler = {
  init: function() {
    if (!document.getElementById) return;
    // set up the appropriate wrapper
    wraphandler.setWrapper();
    // and make sure it gets set up again if you resize the window
    wraphandler.addEvent(window,"resize", wraphandler.setWrapper);
  },

  setWrapper: function() {
    // width stuff from ppk's evolt.org/article/document_body_doctype_switching_and_more/17/30655/index.html
    var theWidth = 0;
    if (window.innerWidth) {
	theWidth = window.innerWidth
    } else if (document.documentElement &&
                document.documentElement.clientWidth) {
	theWidth = document.documentElement.clientWidth
    } else if (document.body) {
	theWidth = document.body.clientWidth
    }
    if (theWidth != 0) {
      if (theWidth < 990) {
        document.getElementById('wrapper').className = 'altwrapper';
        document.getElementById('sidebar-a').className = 'altsidebar';
        document.getElementById('header').className = 'altheader';
      } else {
        document.getElementById('wrapper').className = 'mainwrapper';
        document.getElementById('sidebar-a').className = 'mainsidebar';
        document.getElementById('header').className = 'mainheader';
      }
    }
  },

// addEvent stuff from John Resig's ejohn.org/projects/flexible-javascript-events
  addEvent: function( obj, type, fn ) {
    if ( obj.attachEvent ) {
      obj['e'+type+fn] = fn;
      obj[type+fn] = function(){obj['e'+type+fn]( window.event );}
      obj.attachEvent( 'on'+type, obj[type+fn] );
    } else {
      obj.addEventListener( type, fn, false );
    }
  }
}

wraphandler.addEvent(window,"load",wraphandler.init);
