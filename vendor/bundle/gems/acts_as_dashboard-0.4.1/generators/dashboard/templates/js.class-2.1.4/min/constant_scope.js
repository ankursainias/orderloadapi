JS.ConstantScope=new JS.Module('ConstantScope',{extend:{included:function(a){a.__consts__=new JS.Module();a.extend(this.ClassMethods);a.include(a.__consts__);a.extend(a.__consts__);a.include(a.__mod__.__fns__);a.extend(a.__eigen__().__fns__)},ClassMethods:new JS.Module({extend:function(){var a=JS.ConstantScope.extract(arguments[0],this);this.__consts__.include(a);this.callSuper()},include:function(){var a=JS.ConstantScope.extract(arguments[0],this);this.__consts__.include(a);this.callSuper()}}),extract:function(a,e){if(!a)return null;if(JS.isType(a,JS.Module))return null;var d={},b,c;for(b in a){if(!/^[A-Z]/.test(b))continue;c=a[b];d[b]=c;delete a[b];if(JS.isType(c,JS.Module)){c.include(this);c.__consts__.include(e.__consts__)}}return d}}});