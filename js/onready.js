      var ready = (function(){    
          var readyList,
              DOMContentLoaded,
              class2type = {};
              class2type["[object Boolean]"] = "boolean";
              class2type["[object Number]"] = "number";
              class2type["[object String]"] = "string";
              class2type["[object Function]"] = "function";
              class2type["[object Array]"] = "array";
              class2type["[object Date]"] = "date";
              class2type["[object RegExp]"] = "regexp";
              class2type["[object Object]"] = "object";

          var ReadyObj = {
              isReady: false,
              readyWait: 1,
              holdReady: function( hold ) {
                  if ( hold ) {
                      ReadyObj.readyWait++;
                  } else {
                      ReadyObj.ready( true );
                  }
              },
              ready: function( wait ) {
                  if ( (wait === true && !--ReadyObj.readyWait) || (wait !== true && !ReadyObj.isReady) ) {
                      if ( !document.body ) {
                          return setTimeout( ReadyObj.ready, 1 );
                      }
                      ReadyObj.isReady = true;
                      if ( wait !== true && --ReadyObj.readyWait > 0 ) {
                          return;
                      }
                      readyList.resolveWith( document, [ ReadyObj ] );
                  }
              },
              bindReady: function() {
                  if ( readyList ) {
                      return;
                  }
                  readyList = ReadyObj._Deferred();
                  if ( document.readyState === "complete" ) {
                      return setTimeout( ReadyObj.ready, 1 );
                  }
                  if ( document.addEventListener ) {
                      document.addEventListener( "DOMContentLoaded", DOMContentLoaded, false );
                      window.addEventListener( "load", ReadyObj.ready, false );
                  } else if ( document.attachEvent ) {
                      document.attachEvent( "onreadystatechange", DOMContentLoaded );
                      window.attachEvent( "onload", ReadyObj.ready );
                      var toplevel = false;
                      try {
                          toplevel = window.frameElement === null;
                      } catch(e) {}
                      if ( document.documentElement.doScroll && toplevel ) {
                          doScrollCheck();
                      }
                  }
              },
              _Deferred: function() {
                  var callbacks = [],
                      fired,
                      firing,
                      cancelled,
                      deferred  = {
                          done: function() {
                              if ( !cancelled ) {
                                  var args = arguments,
                                      i,
                                      length,
                                      elem,
                                      type,
                                      _fired;
                                  if ( fired ) {
                                      _fired = fired;
                                      fired = 0;
                                  }
                                  for ( i = 0, length = args.length; i < length; i++ ) {
                                      elem = args[ i ];
                                      type = ReadyObj.type( elem );
                                      if ( type === "array" ) {
                                          deferred.done.apply( deferred, elem );
                                      } else if ( type === "function" ) {
                                          callbacks.push( elem );
                                      }
                                  }
                                  if ( _fired ) {
                                      deferred.resolveWith( _fired[ 0 ], _fired[ 1 ] );
                                  }
                              }
                              return this;
                          },
                          resolveWith: function( context, args ) {
                              if ( !cancelled && !fired && !firing ) {
                                  args = args || [];
                                  firing = 1;
                                  try {
                                      while( callbacks[ 0 ] ) {
                                          callbacks.shift().apply( context, args );
                                      }
                                  }
                                  finally {
                                      fired = [ context, args ];
                                      firing = 0;
                                  }
                              }
                              return this;
                          },
                          resolve: function() {
                              deferred.resolveWith( this, arguments );
                              return this;
                          },
                          isResolved: function() {
                              return !!( firing || fired );
                          },
                          cancel: function() {
                              cancelled = 1;
                              callbacks = [];
                              return this;
                          }
                      };

                  return deferred;
              },
              type: function( obj ) {
                  return obj === null ?
                      String( obj ) :
                      class2type[ Object.prototype.toString.call(obj) ] || "object";
              }
          };
          function doScrollCheck() {
              if ( ReadyObj.isReady ) {
                  return;
              }

              try {
                  document.documentElement.doScroll("left");
              } catch(e) {
                  setTimeout( doScrollCheck, 1 );
                  return;
              }
              ReadyObj.ready();
          }
          if ( document.addEventListener ) {
              DOMContentLoaded = function() {
                  document.removeEventListener( "DOMContentLoaded", DOMContentLoaded, false );
                  ReadyObj.ready();
              };
          } else if ( document.attachEvent ) {
              DOMContentLoaded = function() {
                  if ( document.readyState === "complete" ) {
                      document.detachEvent( "onreadystatechange", DOMContentLoaded );
                      ReadyObj.ready();
                  }
              };
          }
          function ready( fn ) {
              ReadyObj.bindReady();
              var type = ReadyObj.type( fn );
              readyList.done( fn );
          }
          return ready;
      })();