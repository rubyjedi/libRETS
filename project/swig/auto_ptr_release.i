namespace std {
   template <class T> class unique_ptr {};
}



%define SWIG_AUTO_PTR_RELEASE_PROXY(TYPE, PROXYCLASS)
    
#if defined(SWIGCSHARP)

%typemap (ctype) std::unique_ptr<TYPE> "void *"
%typemap (imtype, out="IntPtr") std::unique_ptr<TYPE> "HandleRef"
%typemap (cstype) std::unique_ptr<TYPE> "PROXYCLASS"
%typemap (out) std::unique_ptr<TYPE> %{
  $result = (void *)$1.release();
%}
%typemap(csout, excode=SWIGEXCODE) std::unique_ptr<TYPE> {
    IntPtr cPtr = $imcall;
    PROXYCLASS ret = (cPtr == IntPtr.Zero) ? null : new PROXYCLASS(cPtr, true);$excode
    return ret;
  }

#elif defined(SWIGJAVA)
%typemap (ctype) std::unique_ptr<TYPE> "void *"
%typemap (jtype, out="jlong") std::unique_ptr<TYPE> "long"
%typemap (jstype) std::unique_ptr<TYPE> "PROXYCLASS"
%typemap (javaout) std::unique_ptr<TYPE> {
    long cPtr = $jnicall;
    PROXYCLASS ret = (cPtr == 0) ? null : new PROXYCLASS(cPtr, true);
    return ret;
}
%typemap(out) std::unique_ptr<TYPE> {
      *(TYPE **)&$result = $1.release();
}
#elif defined(SWIGPERL)

%typemap(out) std::unique_ptr<TYPE>
    "ST(argvi) = sv_newmortal();
     SWIG_MakePtr(ST(argvi++), (void *) $1.release(), $descriptor(TYPE *), $shadow|SWIG_POINTER_OWN);";

#elif defined(SWIGPYTHON) || defined(SWIGRUBY) || defined(SWIGJAVASCRIPT)

%typemap(out) std::unique_ptr<TYPE>
    "$result = SWIG_NewPointerObj((void *) $1.release(), $descriptor(TYPE *), SWIG_POINTER_OWN);"

#elif defined(SWIGPHP)

%typemap(out) std::unique_ptr<TYPE>
%{
   // Release the auto_ptr and create a Zend resource.
   SWIG_SetPointerZval($result, (void *) $1.release(), $descriptor(TYPE *), SWIG_POINTER_OWN);
   // Now create the PHP object to contain the class to which the auto_ptr
   // was referencing.

#if PHP_MAJOR_VERSION >= 7
   zval obj, _cPtr;
   _cPtr = *$result;
   memset(&*$result, 0, sizeof(*$result));

   zend_string *class_name;
   zend_class_entry *ce;

   class_name = zend_string_init("TYPE", strlen("TYPE"), 0);
   ce = zend_lookup_class(class_name);
   zend_string_release(class_name);

   if (!ce) {
       SWIG_PHP_Error(E_ERROR, "Unable to locate class entry for TYPE.");
   }

   object_init_ex(&obj, ce);
   add_property_zval(&obj, "_cPtr", &_cPtr);
   *$result = obj;
   
#else
   zval *obj, *_cPtr;
   MAKE_STD_ZVAL(obj);
   MAKE_STD_ZVAL(_cPtr);
   *_cPtr = *$result;
   INIT_ZVAL(*$result);
   // Lookup the Class Entry for this class.
   zend_class_entry *ce;
   zend_class_entry **pce;
   if (FAILURE == zend_lookup_class("TYPE",strlen("TYPE"), &pce TSRMLS_CC))
   {
       SWIG_PHP_Error(E_ERROR, "Unable to locate class entry for TYPE.");
   }

   ce = *pce;
   // Initialize it, attach the _cPtr  and return it.
   object_init_ex(obj, ce);
   add_property_zval(obj, "_cPtr",_cPtr);
   *$result = *obj;
#endif
%}
#else
#error "Unsupported SWIG language for auto_ptr_release"
#endif

%template() std::unique_ptr<TYPE>;
%enddef
;

%define SWIG_AUTO_PTR_RELEASE(TYPE)
    SWIG_AUTO_PTR_RELEASE_PROXY(TYPE, TYPE)
%enddef

SWIG_AUTO_PTR_RELEASE(Foo)
    ;
%define SWIG_RELEASE_AUTO_PTR(RETURN_TYPE, METHOD_NAME, PROTO, ARGS)
    %extend {
    RETURN_TYPE * METHOD_NAME PROTO {
        std::unique_ptr<RETURN_TYPE> auto_result = self->METHOD_NAME ARGS;
        return auto_result.release();
    }
}
%enddef
