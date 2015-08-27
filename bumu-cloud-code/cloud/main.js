
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

/*
Parse.Cloud.beforeSave(Parse.User, function(request,response) {
  //if facebook sign-up case go to success
  if (!request.object.get("isActive")) {
  	response.success();
  } else {
  	if (!request.object.get("email") || request.object.get("email").length === 0) {
    response.error("E-posta adresi gerekli.");
  } else if(!request.object.get("bumuName") || request.object.get("bumuName").length === 0) {
  	response.error("Kullanıcı adı gerekli.");
  } else {
  	var query = new Parse.Query(Parse.User);
    query.equalTo("bumuName", request.object.get("bumuName"));
    query.first({
      success: function(object) {
        if (object) {
          response.error("Bu kullanıcı adı ile kayıtlı başka bir kullanıcı var.");
        } else {
          response.success();
        }
      },
      error: function(error) {
        response.error("Kayıtta bir hata oluştu, lütfen tekrar deneyin");
      }
    });
  }
 } 
});*/
