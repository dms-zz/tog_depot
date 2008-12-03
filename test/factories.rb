Factory.define :user do |u|
  u.salt '9c3b835d47f73a22f22fb2ee3b20b8f4d3c84fbe'
  u.crypted_password 'e06d3c1e75543efe814829a341fb783d23c0f9b9'
  u.activation_code ''
  u.state 'active'
  u.email {'ignacio.vega@dmsti.es'}
end

Factory.define :file do |f|
  f.title 'file title'
  f.description 'file description'
end

Factory.define :filefolder do |ff|
  ff.title 'filefolder title'
  ff.description 'filefolder description'
end
