package signup

import (
	"github.com/SupermarketSalesBackend/model/requests"
	"github.com/SupermarketSalesBackend/model/response"
	"github.com/SupermarketSalesBackend/model/user"
	"github.com/SupermarketSalesBackend/pkg/jwt"
	"github.com/gin-gonic/gin"
)

// ShowAccount godoc
// @Summary      Sign up Using Phone
// @Description  使用手机号和密码注册帐号
// @Tags         sign
// @Accept       json
// @Produce      json
// @Param        req  {object}  body requests.SignupUsingPhoneRequest  true  "Phone--电话号码||Password-- 密码|| Name--昵称"
// @Success      200  {object}  response.Response
// @Failure      400  {object}  response.Response
// @Failure      400  {object}  response.Response
// @Failure      404  {object}  response.Response
// @Failure      500  {object}  response.Response
// @Router       /api/v1/sign/member   [post]
// SignupUsingPhone 使用手机和密码进行注册
func MemberUserSignupUsingPhone(c *gin.Context) {
	// 1. 验证表单
	request := requests.SignupUsingPhoneRequest{}
	// 2. 绑定
	if err := c.Bind(&request); err != nil {
		response.Error(c, err, "请求失败")
		return
	}
	err := user.JudgeMemberUserPhoneExist(request.Phone)
	if err != nil {
		response.BadRequest(c, err)
		return
	}
	// 2. 验证成功，创建数据
	userModel := user.MemberUserModel{
		Name:     request.Name,
		Phone:    request.Phone,
		Password: request.Password,
	}
	err = userModel.Create()
	if err != nil {
		response.Abort500(c, err.Error())
	}
	if userModel.ID > 0 {
		token := jwt.NewJWT().IssueToken(userModel.GetStringID(), userModel.Name)
		response.CreatedJSON(c, gin.H{
			"token":  token,
			"userId": userModel.GetStringID(),
		})
	} else {
		response.Abort500(c, "创建用户失败，请稍后尝试~")
		return
	}

}
