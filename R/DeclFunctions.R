# API functions to be exposed to the user

#' @title int declaration
#' @description 
#' Declare a new int
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param domain domain of the int variable (NULL by default)
#' @param value pass a numeric/integer value in R (NULL by default)
#' @export
IntDecl = function(name, kind, value = NULL, domain = NULL){
  if(!is.null(domain)){
    parTI = TypeInst$new(type = Type$new(base_type = "unknown", kind = kind), domain = domain)  
  }else{
    parTI = TypeInst$new(type = Type$new(base_type = "int", kind = kind))
  }
  if(!is.null(value)){
    value = Int$new(value)
  }
  return(VarDecl$new(name = name, type_inst = parTI, value = value))
}

#' @title float declaration
#' @description 
#' Declare a new float
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param domain domain of the float variable (NULL by default)
#' @param value pass a numeric/double value in R (NULL by default)
#' @export
FloatDecl = function(name, kind, value = NULL, domain = NULL){
  if(!is.null(domain)){
    parTI = TypeInst$new(type = Type$new(base_type = "unknown", kind = kind), domain = domain)  
  }else{
    parTI = TypeInst$new(type = Type$new(base_type = "float", kind = kind))
  }
  if(!is.null(value)){
    value = Float$new(value)
  }
  return(VarDecl$new(name = name, type_inst = parTI, value = value))
}

#' @title new bool declaration
#' @description 
#' Declare a new bool 
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param value provide TRUE or FALSE (NULL by default)
#' @export
BoolDecl = function(name, kind, value = NULL){
  parTI = TypeInst$new(Type$new(base_type = "bool", kind = kind))
  if(!is.null(value)){
    value = Bool$new(value)
  }
  return(VarDecl$new(name, parTI, value))
}

#' @title int set declaration
#' @description 
#' Declare a new set of int
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param value provide an IntSetVal object (NULL by default)
#' @export
IntSetDecl = function(name, kind, value = NULL){
  parTI = TypeInst$new(Type$new(base_type = "int", kind = kind, set_type = TRUE))
  return(VarDecl$new(name, parTI, value))
}

#' @title set of float declaration
#' @description 
#' Declare a new set of float
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param value provide an FloatSetVal object (or NULL)
#' @export
FloatSetDecl = function(name, kind, value = NULL){
  parTI = TypeInst$new(Type$new(base_type = "float", kind = kind, set_type = TRUE))
  return(VarDecl$new(name, parTI, value))
}

#' @title set of bool declaration
#' @description
#' Declare a new set of bool
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param value provide a Set object (or NULL)
#' @export
BoolSetDecl = function(name, kind, value = NULL){
  parTI = TypeInst$new(Type$new(base_type = "bool", kind = kind, set_type = TRUE))
  return(VarDecl$new(name, parTI, value))
}

#' @title set of string declaration
#' @description declare a new set of string
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param value provide a Set object (or NULL)
#' @export
StringSetDecl = function(name, kind, value = NULL){
  parTI = TypeInst$new(Type$new(base_type = "string", kind = kind, set_type = TRUE))
  return(VarDecl$new(name, parTI, value))
}

#' @title n-D int array declaration
#' @description
#' Declare a new n-dimensional array
#' of int
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param ind index of the array
#' @param value Array Object (NULL by default)
#' @param ndim number of dimensions of the array
#' @export
IntArrDecl = function(name, kind, ind, value = NULL, ndim){
  parTI = TypeInst$new(Type$new(base_type = "int", kind = kind, dim = ndim), indexExprVec = ind)
  return(VarDecl$new(name, parTI, value))
}

#' @title n-D float array declaration
#' @description 
#' Declare a new n-dimensional array
#' of float
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param ind index of the array
#' @param value value (NULL by default)
#' @param ndim number of dimensions of the array
#' @export
FloatArrDecl = function(name, kind, ind, value = NULL, ndim){
  parTI = TypeInst$new(Type$new(base_type = "float", kind = kind, dim = ndim), indexExprVec = ind)
  return(VarDecl$new(name, parTI, value))
}  


#' @title n-D bool array declaration
#' @description 
#' Declare a new n-dimensional array
#' of bools
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param ind index of the array
#' @param value value (NULL by default)
#' @param ndim number of dimensions of the array
#' @export
BoolArrDecl = function(name, kind, ind, value = NULL, ndim){
  parTI = TypeInst$new(Type$new(base_type = "bool", kind = kind, dim = ndim), indexExprVec = ind)
  return(VarDecl$new(name, parTI, value))
}

#' @title n-D String array declaration
#' @description 
#' Declare a new n-dimensional array
#' of strings
#' @param name variable/parameter name
#' @param kind "var" or "par"
#' @param ind index of the array
#' @param value value (NULL by default)
#' @param ndim number of dimensions of the array
#' @export
StringArrDecl = function(name, kind, ind, value = NULL, ndim){
  parTI = TypeInst$new(Type$new(base_type = "bool", kind = kind, dim = ndim), indexExprVec = ind)
  return(VarDecl$new(name, parTI, value))
}

#' @title declare 0-D variable with domain
#' @description 
#' Declare a 0 dimensional (int, float,
#' bool or string) variable with domain 
#' @param name variable name
#' @param dom domain
#' @export
VarDomainDecl = function(name, dom){
  parTI = TypeInst$new(Type$new(base_type = "unknown", kind = "var"), domain = dom)
  return(VarDecl$new(name = name, type_inst = parTI))
}

#' @title declare n-D array with domain
#' @description 
#' Declare a n-dimensional array 
#' with domain 
#' @param name variable name
#' @param kind variable or parameter
#' @param dom domain
#' @param ndim number of dimensions
#' @export
ArrDomainDecl = function(name, kind, dom, ndim){
  parTI = TypeInst$new(Type$new(base_type = "unknown", kind = kind, dim = ndim), domain = dom)
  return(VarDecl$new(name = name, type_inst = parTI))
}

