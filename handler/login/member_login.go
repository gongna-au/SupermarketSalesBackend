package login

import (
	"github.com/SupermarketSalesBackend/model/requests"
	"github.com/SupermarketSalesBackend/model/response"
	"github.com/SupermarketSalesBackend/model/user"
	"github.com/SupermarketSalesBackend/pkg/jwt"
	"github.com/gin-gonic/gin"
)

// ShowAccount godoc
// @Summary      Login By Phone
// @Description  会员通过帐号和密码登陆
// @Tags         login
// @Accept       json
// @Produce      json
// @Param        req  {object}  body requests.LoginByPhoneRequest  true  "Phone--电话号码 和Password--密码"
// @Success      200  {object}  response.Response
// @Failure      400  {object}  response.Response
// @Failure      404  {object}  response.Response
// @Failure      422  {object}  response.Response
// @Router       /api/v1/login/member  [post]
// MemberUserLoginByPhone 会员通过手机登录
func MemberUserLoginByPhone(c *gin.Context) {
	// 1. 验证表单
	request := requests.LoginByPhoneRequest{}
	if err := c.Bind(&request); err != nil {
		response.Error(c, err, "请求失败")
		return
	}
	// 2. 尝试登录
	user, err := user.GetMemberUserByPhoneAndPassword(request.Phone, request.Password)
	if err != nil {
		// 失败，显示错误提示
		response.Error(c, err, "账号不存在或密码错误")
		return
	} else {
		// 登录成功
		token := jwt.NewJWT().IssueToken(user.GetStringID(), user.Name)
		response.JSON(c, gin.H{
			"token":  token,
			"userId": user.GetStringID(),
		})
	}

}
