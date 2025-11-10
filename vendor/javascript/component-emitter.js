// component-emitter@1.3.1 downloaded from https://ga.jspm.io/npm:component-emitter@1.3.1/index.js

var t=typeof globalThis!=="undefined"?globalThis:typeof self!=="undefined"?self:global;var e={};e=Emitter;function Emitter(t){if(t)return mixin(t)}
/**
 * Mixin the emitter properties.
 *
 * @param {Object} obj
 * @return {Object}
 * @api private
 */
function mixin(t){for(var e in Emitter.prototype)t[e]=Emitter.prototype[e];return t}
/**
 * Listen on the given `event` with `fn`.
 *
 * @param {String} event
 * @param {Function} fn
 * @return {Emitter}
 * @api public
 */Emitter.prototype.on=Emitter.prototype.addEventListener=function(e,i){(this||t)._callbacks=(this||t)._callbacks||{};((this||t)._callbacks["$"+e]=(this||t)._callbacks["$"+e]||[]).push(i);return this||t};
/**
 * Adds an `event` listener that will be invoked a single
 * time then automatically removed.
 *
 * @param {String} event
 * @param {Function} fn
 * @return {Emitter}
 * @api public
 */Emitter.prototype.once=function(e,i){function on(){this.off(e,on);i.apply(this||t,arguments)}on.fn=i;this.on(e,on);return this||t};
/**
 * Remove the given callback for `event` or all
 * registered callbacks.
 *
 * @param {String} event
 * @param {Function} fn
 * @return {Emitter}
 * @api public
 */Emitter.prototype.off=Emitter.prototype.removeListener=Emitter.prototype.removeAllListeners=Emitter.prototype.removeEventListener=function(e,i){(this||t)._callbacks=(this||t)._callbacks||{};if(0==arguments.length){(this||t)._callbacks={};return this||t}var r=(this||t)._callbacks["$"+e];if(!r)return this||t;if(1==arguments.length){delete(this||t)._callbacks["$"+e];return this||t}var s;for(var n=0;n<r.length;n++){s=r[n];if(s===i||s.fn===i){r.splice(n,1);break}}r.length===0&&delete(this||t)._callbacks["$"+e];return this||t};
/**
 * Emit `event` with the given args.
 *
 * @param {String} event
 * @param {Mixed} ...
 * @return {Emitter}
 */Emitter.prototype.emit=function(e){(this||t)._callbacks=(this||t)._callbacks||{};var i=new Array(arguments.length-1),r=(this||t)._callbacks["$"+e];for(var s=1;s<arguments.length;s++)i[s-1]=arguments[s];if(r){r=r.slice(0);s=0;for(var n=r.length;s<n;++s)r[s].apply(this||t,i)}return this||t};
/**
 * Return array of callbacks for `event`.
 *
 * @param {String} event
 * @return {Array}
 * @api public
 */Emitter.prototype.listeners=function(e){(this||t)._callbacks=(this||t)._callbacks||{};return(this||t)._callbacks["$"+e]||[]};
/**
 * Check if this emitter has `event` handlers.
 *
 * @param {String} event
 * @return {Boolean}
 * @api public
 */Emitter.prototype.hasListeners=function(t){return!!this.listeners(t).length};var i=e;export{i as default};

