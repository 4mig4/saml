package = "lua-resty-saml"
version = "dev-1"
source = {
  url = "git+ssh://git@github.com/megalord/lua-resty-saml.git"
}
description = {
  summary = "Provides SAML support for OpenResty",
  homepage = "https://megalord.github.io/lua-resty-saml/",
  license = "MIT",
}
dependencies = {
  "lua >= 5.1",
  "lua-zlib",
}
external_dependencies = {
  LIBXML2 = {
    library = "xml2"
  },
  XMLSEC1 = {
    library = "xmlsec1"
  },
}
build = {
  type = "make",
  modules = {
    saml = {
      sources = { "saml.c" },
      libraries = { "xml2", "xmlsec1", },
      incdirs = { "$(LIBXML2_INCDIR)/libxml2", "$(XMLSEC1_INCDIR)/xmlsec1" },
      libdirs = { "$(LIBXML2_LIBDIR)", "$(XMLSEC1_LIBDIR)" }
    },
    ["resty.saml.init"] = "lib/resty/saml/init.lua",
    ["resty.saml.binding"] = "lib/resty/saml/binding.lua",
    ["resty.saml.constants"] = "lib/resty/saml/constants.lua",
    ["resty.saml.internal.xml"] = "lib/resty/saml/internal/xml.lua",
    ["resty.saml.internal.xmlsec"] = "lib/resty/saml/internal/xmlsec.lua",
    ["resty.saml.internal.xmlsec-cdef"] = "lib/resty/saml/internal/xmlsec-cdef.lua",
    ["resty.saml.sig"] = "lib/resty/saml/sig.lua",
    ["resty.saml.xml"] = "lib/resty/saml/xml.lua",
  },
  copy_directories = {
    "data",
  }
}