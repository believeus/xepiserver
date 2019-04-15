function check() {
	//————————————————————————————姓名栏目
	var name = document.getElementById("name").value
	//console.log(name)

	if (name == "" | name == null) {
		alert("姓名不允许为空！")
		return false;
	}

	//————————————————————————————性别栏目
	//获得sex单选框提交时的状态 
	var radios = document.getElementsByName("sex");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择性别")
		return false;
	}

	//————————————————————————————验证时间
	var birthday = document.getElementById("birthday").value

	if (birthday == "" || birthday == null) {
		alert("出生日期不能为空")
		return false
	}


	//————————————————————————————出生年月日验证
	var bir_r = birthday.match(/^(\d{4})(-)(\d{2})(-)(\d{2})$/);

	if (bir_r == null) {
		alert("请输入正确的开始时间格式,如:2017-01-01");
		console.log(birthday)
		return false;
	}

	//————————————————————————————身份证号码验证
	var id = document.getElementById("id").value

	if (id == "" || id == null) {
		alert("身份证输入不能为空")
	}
	// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	if (reg.test(id) === false) {
		alert("身份证输入不合法");
		return false;
	}


	//————————————————————————————婚姻栏目
	//获得marry单选框提交时的状态 
	var radios = document.getElementsByName("marry");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择婚姻状态")
		return false;
	}

	//————————————————————————————文化程度
	//获得education单选框提交时的状态 
	var radios = document.getElementsByName("education");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择文化程度")
		return false;
	}

	//————————————————————————————家庭人口以及平均年收入
	var menber = document.getElementById("famil-menber").value
	var income = document.getElementById("income-per-year").value

	if (menber == "" || menber == null) {
		alert("请填写家庭成员情况")
		return false
	}

	if (income == "" || income == null) {
		alert("请填写平均年收入")
		return false
	}

	//————————————————————————————饮用水来源
	//获得water-source单选框提交时的状态 
	var radios = document.getElementsByName("water-source");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择饮用水来源")
		return false;
	}

	//————————————————————————————吸烟情况
	//获得smoke-or-not单选框提交时的状态 
	var radios = document.getElementsByName("smoke-or-not");
	//声明标识符
	var flag = false;
	var Smoking = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
			if (radios[i].value == "是") {
				Smoking = true
			}
		}
	}

	//如果用户有吸烟则需要填写年份
	if (Smoking) {
		var year = document.getElementById("smoke-year").value
		if (year == "" || year == null) {
			alert("请填写吸烟时长")
		}
	}

	if (!flag) {
		alert("请选择吸烟情况")
		return false;
	}

	//————————————————————————————戒烟情况
	//获得quit-smoke单选框提交时的状态 
	var radios = document.getElementsByName("quit-smoke");
	//声明标识符
	var flag = false;
	var Smoking = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
			if (radios[i].value == "是") {
				Smoking = true
			}
		}
	}

	//如果用户有戒烟则需要填写年份
	if (Smoking) {
		var year = document.getElementById("quit-smoke-year").value
		if (year == "" || year == null) {
			alert("请填写戒烟时长")
			return false
		}
	}

	if (!flag) {
		alert("请选择戒烟情况")
		return false;
	}

	//————————————————————————————饮酒情况
	//获得drink单选框提交时的状态 
	var radios = document.getElementsByName("drink");
	//声明标识符
	var flag = false;
	var drink = "";


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
			if (radios[i].value == "啤酒") {
				drink = "啤酒"
			} else if (radios[i].value == "白酒") {
				drink = "白酒"
			} else if (radios[i].value == "黄酒") {
				drink = "黄酒"
			} else if (radios[i].value == "米酒") {
				drink = "米酒"
			}
		}
	}

	//litre/day
	if (drink != "") {
		var day = document.getElementsByName("litre/day")
		var year = document.getElementsByName("beer-drink-year")
		if (drink == "啤酒") {
			// 			console.log(day[0].value)
			// 			console.log(year[0].value)
			if (day[0].value == "" || day[0].value == null) {
				//console.log(day[0].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}

			if (year[0].value == "" || year[0] == null) {
				//console.log(year[0].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}
		}
		if (drink == "白酒") {
			// 			console.log(day[1].value)
			// 			console.log(year[1].value)
			if (day[1].value == "" || day[1].value == null) {
				//console.log(day[1].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}

			if (year[1].value == "" || year[1] == null) {
				//console.log(year[1].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}
		}
		if (drink == "黄酒") {
			// 			console.log(day[2].value)
			// 			console.log(year[2].value)
			if (day[2].value == "" || day[2].value == null) {
				//console.log(day[2].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}

			if (year[2].value == "" || year[2] == null) {
				//console.log(year[2].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}
		}
		if (drink == "米酒") {
			// 			console.log(day[3].value)
			// 			console.log(year[3].value)
			if (day[3].value == "" || day[3].value == null) {
				//console.log(day[3].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}

			if (year[3].value == "" || year[3] == null) {
				//console.log(year[3].value)
				alert("请查看饮酒习惯是否填写完整")
				return false
			}
		}
	}

	if (!flag) {
		alert("请选择饮酒情况")
		return false;
	}


	//————————————————————————————饮茶情况
	//获得drink单选框提交时的状态 
	var radios = document.getElementsByName("tea");
	//声明标识符
	var flag = false;
	var drink = "";


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
			if (radios[i].value == "花茶") {
				drink = "花茶"
			} else if (radios[i].value == "红茶") {
				drink = "红茶"
			} else if (radios[i].value == "绿茶") {
				drink = "绿茶"
			}
		}
	}

	//litre/day
	if (drink != "") {
		var day = document.getElementsByName("ml/day")
		var year = document.getElementsByName("flower-tea-year")
		if (drink == "花茶") {
			console.log(day[0].value)
			console.log(year[0].value)
			if (day[0].value == "" || day[0].value == null) {
				//console.log(day[0].value)
				alert("请查看饮茶习惯是否填写完整")
				return false
			}

			if (year[0].value == "" || year[0] == null) {
				//console.log(year[0].value)
				alert("请查看饮茶习惯是否填写完整")
				return false
			}
		}
		if (drink == "红茶") {
			// 			console.log(day[1].value)
			// 			console.log(year[1].value)
			if (day[1].value == "" || day[1].value == null) {
				//console.log(day[1].value)
				alert("请查看饮茶习惯是否填写完整")
				return false
			}

			if (year[1].value == "" || year[1] == null) {
				//console.log(year[1].value)
				alert("请查看饮茶习惯是否填写完整")
				return false
			}
		}
		if (drink == "绿茶") {
			// 			console.log(day[2].value)
			// 			console.log(year[2].value)
			if (day[2].value == "" || day[2].value == null) {
				//console.log(day[2].value)
				alert("请查看饮茶习惯是否填写完整")
				return false
			}

			if (year[2].value == "" || year[2] == null) {
				//console.log(year[2].value)
				alert("请查看饮茶习惯是否填写完整")
				return false
			}
		}
	}

	if (!flag) {
		alert("请选择饮茶情况")
		return false;
	}


	//————————————————————————————饮食习惯
	//每周食用蔬菜判断
	//获得vegitable单选框提交时的状态 
	var radios = document.getElementsByName("vegitable");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择食用新鲜蔬菜情况")
		return false;
	}

	//每周食用水果判断
	//获得fruit单选框提交时的状态 
	var radios = document.getElementsByName("fruit");
	//声明标识符
	var flag = false;

	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择食用新鲜水果情况")
		return false;
	}

	//每周食用肉蛋奶类判断
	//获得eggmilk单选框提交时的状态 
	var radios = document.getElementsByName("eggmilk");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择食用肉蛋奶类情况")
		return false;
	}


	//每周食用腌制品判断
	//获得pickledfood单选框提交时的状态 
	var radios = document.getElementsByName("pickledfood");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择食用腌制品情况")
		return false;
	}

	//每周食用油炸熏制食品判断
	//获得smokefood单选框提交时的状态 
	var radios = document.getElementsByName("smokefood");
	//声明标识符
	var flag = false;


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			//弹出选中单选按钮的值
			//alert(radios[i].value);
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择食用油炸熏制食品情况")
		return false;
	}


	//肠道疾病史
	//获得colitis单选框提交时的状态 
	var radios = document.getElementsByName("colitis");
	//声明标识符
	var flag = false;
	var get = false


	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			if (radios[i].value == "是") {
				get = true
			}
			flag = true;
		}
	}

	if (!flag) {
		alert("请选择肠道疾病史中-慢性结肠炎情况")
		return false;
	}

	//若患者选择是 则需要判别诊断是的年龄
	if (get) {
		var age = document.getElementsByName("age-get-colitis")
		if (age[0] == "" || age[0] == null) {
			alert("请填写慢性结肠炎患病时的年龄")
			return false
		}
	}
	
		//获得ulcerative-colitis单选框提交时的状态 
	var radios = document.getElementsByName("ulcerative-colitis");
	//声明标识符
	var flag = false;
	var get = false
	
	
	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			if (radios[i].value == "是") {
				get = true
			}
			flag = true;
		}
	}
	
	if (!flag) {
		alert("请选择肠道疾病史中-慢性溃疡性结肠炎情况")
		return false;
	}
	
	//若患者选择是 则需要判别诊断是的年龄
	if (get) {
		var age = document.getElementsByName("age-get-colitis")
		if (age[1] == "" || age[1] == null) {
			alert("请填写慢性溃疡性结肠炎患病时的年龄")
			return false
		}
	}
	
		//获得Intestinal-polyps单选框提交时的状态 
	var radios = document.getElementsByName("Intestinal-polyps");
	//声明标识符
	var flag = false;
	var get = false
	
	
	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			if (radios[i].value == "是") {
				get = true
			}
			flag = true;
		}
	}
	
	if (!flag) {
		alert("请选择肠道疾病史中-肠息肉情况")
		return false;
	}
	
	//若患者选择是 则需要判别诊断是的年龄
	if (get) {
		var age = document.getElementsByName("age-get-colitis")
		if (age[2] == "" || age[2] == null) {
			alert("请填写肠息肉患病时的年龄")
			return false
		}
	}
	
		//获得appendicitis单选框提交时的状态 
	var radios = document.getElementsByName("appendicitis");
	//声明标识符
	var flag = false;
	var get = false
	
	
	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			if (radios[i].value == "是") {
				get = true
			}
			flag = true;
		}
	}
	
	if (!flag) {
		alert("请选择肠道疾病史中-慢性阑尾炎情况")
		return false;
	}
	
	//若患者选择是 则需要判别诊断是的年龄
	if (get) {
		var age = document.getElementsByName("age-get-colitis")
		if (age[3] == "" || age[3] == null) {
			alert("请填写慢性阑尾炎患病时的年龄")
			return false
		}
	}
	
	//家族肿瘤患病史
	var radios = document.getElementsByName("tumor");
		//声明标识符
	var flag = false;
	var get = false
	
	
	for (var i = 0; i < radios.length; i++) {
		//判断那个单选按钮为选中状态
		if (radios[i].checked) {
			if (radios[i].value == "是") {
				get = true
			}
			flag = true;
		}
	}
	
	if (!flag) {
		alert("请选择家族肿瘤患病史情况")
		return false;
	}
	
	//若患者选择是 则需要注明肿瘤名称，以及与亲属关系
	if (get) {
		var disease = document.getElementsByName("tumor-other-disease")
		if (disease[0] == "" || disease[0] == null) {
			alert("请填写注明肿瘤名称，以及与您的亲属关系")
			return false
		}
	}
	
	
	//体格检查结果
	var height = document.getElementsByName("height")
	
	if (height[0] == "" || height[0] == null){
		alert("请填写身高栏目")
		return false
	}
	
	var weight = document.getElementsByName("weight")
	if (weight[0] == "" || weight[0] == null){
		alert("请填写体重栏目")
		return false
	}
	
	var pulse = document.getElementsByName("pulse")
	if (pulse[0] == "" || pulse[0] == null){
		alert("请填写脉博栏目")
		return false
	}
	
		var BP = document.getElementsByName("blood-pressure")
	if (BP[0] == "" || BP[0] == null){
		alert("请填写血压栏目")
		return false
	}
	
	return true;
}

function prev() {
    //————————————————————————————姓名栏目
    var name = document.getElementById("name").value
    //console.log(name)

    if (name == "" | name == null) {
        alert("姓名不允许为空！")
        return false;
    }

    //————————————————————————————性别栏目
    //获得sex单选框提交时的状态
    var radios = document.getElementsByName("sex");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择性别")
        return false;
    }

    //————————————————————————————验证时间
    var birthday = document.getElementById("birthday").value

    if (birthday == "" || birthday == null) {
        alert("出生日期不能为空")
        return false
    }


    //————————————————————————————出生年月日验证
    var bir_r = birthday.match(/^(\d{4})(-)(\d{2})(-)(\d{2})$/);

    if (bir_r == null) {
        alert("请输入正确的开始时间格式,如:2017-01-01");
        console.log(birthday)
        return false;
    }

    //————————————————————————————身份证号码验证
    var id = document.getElementById("id").value

    if (id == "" || id == null) {
        alert("身份证输入不能为空")
    }
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(id) === false) {
        alert("身份证输入不合法");
        return false;
    }

    //————————————————————————————常见的癌症栏目
    //获得cancertype单选框提交时的状态
    var radios = document.getElementsByName("cancertype");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择常见的癌症栏目,至少选择一个")
        return false;
    }

    //————————————————————————————70年代以来我国患癌症的人数栏目
    //获得cancer-population单选框提交时的状态
    var radios = document.getElementsByName("cancer-population");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择70年代以来我国患癌症的人数栏目,至少选择一个")
        return false;
    }

    //————————————————————————————主要危险因素栏目
    //获得danger单选框提交时的状态
    var radios = document.getElementsByName("danger");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择主要危险因素栏目,至少选择一个")
        return false;
    }


    //————————————————————————————预防措施栏目
    //获得reduce-cancer单选框提交时的状态
    var radios = document.getElementsByName("reduce-cancer");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择预防措施栏目,至少选择一个")
        return false;
    }


    //————————————————————————————警示症状栏目
    //获得sign单选框提交时的状态
    var radios = document.getElementsByName("sign");
    //声明标识符
    var flag = false;
    var other = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
            
            if (radios[i].value == "其他"){
                other = true
            }
        }
    }

    if (!flag) {
        alert("请选择警示症状栏目,至少选择一个")
        return false;
    }

    if (other){
        var remark = document.getElementById("remark").value

        remark = remark.replace(/\s+/g , "")

        if (remark == "" || remark == null){
            alert("请检查警示症状栏目是否填写完整")
            return false
        }
    }

    //————————————————————————————预防措施栏目
    //获得know单选框提交时的状态
    var radios = document.getElementsByName("know");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择预防措施栏目,至少选择一个")
        return false;
    }


    //————————————————————————————早期发现，早期诊断，早期治疗栏目
    //获得notice单选框提交时的状态
    var radios = document.getElementsByName("notice");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择早治栏目,至少选择一个")
        return false;
    }

    //————————————————————————————大肠癌能治栏目
    //获得cancer-cureable单选框提交时的状态
    var radios = document.getElementsByName("cancer-cureable");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择大肠癌治疗普查,至少选择一个")
        return false;
    }

    //————————————————————————————大肠癌栏目
    //获得early-stage单选框提交时的状态
    var radios = document.getElementsByName("early-stage");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择大肠癌早期普查,至少选择一个")
        return false;
    }

    //————————————————————————————早期大肠癌治疗栏目
    //获得canlive单选框提交时的状态
    var radios = document.getElementsByName("canlive");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择早期大肠癌治疗栏目,至少选择一个")
        return false;
    }

    //————————————————————————————早期大肠癌发现栏目
    //获得check-method单选框提交时的状态
    var radios = document.getElementsByName("check-method");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择早期大肠癌发现栏目,至少选择一个")
        return false;
    }


    //————————————————————————————早期大肠癌发现栏目
    //获得reason单选框提交时的状态
    var radios = document.getElementsByName("reason");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择不参加普查原因,至少选择一个")
        return false;
    }

    //————————————————————————————治疗早期大肠癌栏目
    //获得cure-method单选框提交时的状态
    var radios = document.getElementsByName("cure-method");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择治疗早期大肠癌栏目,至少选择一个")
        return false;
    }

    //————————————————————————————预防大肠癌栏目
    //获得can-prevent单选框提交时的状态
    var radios = document.getElementsByName("can-prevent");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择预防大肠癌栏目,至少选择一个")
        return false;
    }

    //————————————————————————————预防大肠癌栏目
    //获得can-cure单选框提交时的状态
    var radios = document.getElementsByName("can-cure");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择预防大肠癌栏目,至少选择一个")
        return false;
    }


    //————————————————————————————预防大肠癌栏目
    //获得waste-water单选框提交时的状态
    var radios = document.getElementsByName("waste-water");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择预防大肠癌栏目,至少选择一个")
        return false;
    }


    //————————————————————————————就诊情况栏目
    //获得see-doctor单选框提交时的状态
    var radios = document.getElementsByName("see-doctor");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择就诊情况栏目,至少选择一个")
        return false;
    }


    //————————————————————————————普查栏目
    //获得fam-member-atten单选框提交时的状态
    var radios = document.getElementsByName("fam-member-atten");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择就诊情况栏目,至少选择一个")
        return false;
    }

    return true
}

function quan() {
    //————————————————————————————姓名栏目
    var name = document.getElementById("name").value
    //console.log(name)

    if (name == "" | name == null) {
        alert("姓名不允许为空！")
        return false;
    }

    //————————————————————————————性别栏目
    //获得sex单选框提交时的状态
    var radios = document.getElementsByName("sex");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择性别")
        return false;
    }

    //————————————————————————————验证时间
    var birthday = document.getElementById("birthday").value

    if (birthday == "" || birthday == null) {
        alert("出生日期不能为空")
        return false
    }


    //————————————————————————————出生年月日验证
    var bir_r = birthday.match(/^(\d{4})(-)(\d{2})(-)(\d{2})$/);

    if (bir_r == null) {
        alert("请输入正确的开始时间格式,如:2017-01-01");
        console.log(birthday)
        return false;
    }

    //————————————————————————————身份证号码验证
    var id = document.getElementById("id").value

    if (id == "" || id == null) {
        alert("身份证输入不能为空")
    }
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(id) === false) {
        alert("身份证输入不合法");
        return false;
    }

    //————————————————————————————电话号码
    var telephone = document.getElementById("telephone").value

    if (telephone == "" || telephone == null) {
        alert("电话号码不能为空")
        return false
    }

    //————————————————————————————现居地址
    var address = document.getElementById("address").value

    if (address == "" || address == null) {
        alert("现居地址不能为空")
        return false
    }

    //————————————————————————————婚姻栏目
    //获得marry单选框提交时的状态
    var radios = document.getElementsByName("marry");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择婚姻状态")
        return false;
    }

    //————————————————————————————文化程度
    //获得education单选框提交时的状态
    var radios = document.getElementsByName("education");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择文化程度")
        return false;
    }


    //————————————————————————————慢性腹泻史栏目
    //获得diarrhea单选框提交时的状态
    var radios = document.getElementsByName("diarrhea");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择慢性腹泻史栏目,至少选择一个")
        return false;
    }

    //————————————————————————————慢性便秘史栏目
    //获得constipation单选框提交时的状态
    var radios = document.getElementsByName("constipation");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择慢性便秘史栏目,至少选择一个")
        return false;
    }

    //————————————————————————————粘液或血便史栏目
    //获得bloody-stool单选框提交时的状态
    var radios = document.getElementsByName("bloody-stool");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择粘液或血便史栏目,至少选择一个")
        return false;
    }


    //————————————————————————————慢性阑尾炎或阑尾切除史栏目
    //获得appendix单选框提交时的状态
    var radios = document.getElementsByName("appendix");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择慢性阑尾炎或阑尾切除史栏目,至少选择一个")
        return false;
    }


    //————————————————————————————慢性胆囊炎或胆囊切除史栏目
    //获得cholecystitis单选框提交时的状态
    var radios = document.getElementsByName("cholecystitis");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
        }
    }

    if (!flag) {
        alert("请选择慢性胆囊炎或胆囊切除史栏目,至少选择一个")
        return false;
    }


    //————————————————————————————不良生活事件史栏目
    //获得unhealth-life单选框提交时的状态
    var radios = document.getElementsByName("unhealth-life");
    //声明标识符
    var flag = false;


    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;

        }
    }

    if (!flag) {
        alert("请选择不良生活事件史栏目,至少选择一个")
        return false;
    }


    //————————————————————————————癌症史栏目
    //获得cancer-own单选框提交时的状态
    var radios = document.getElementsByName("cancer-own");
    //声明标识符
    var flag = false;
    var cancer = false;

    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
            if (radios[i].value == "有"){
                console.log(radios[i].value)
                cancer = true
            }

        }
    }

    if (!flag) {
        alert("请选择个人癌症史,至少选择一个")
        return false;
    }
    
    if (cancer){
        var age = document.getElementsByName("cancer-age")[0].value
        var hospital = document.getElementsByName("hospital")[0].value

        age = age.trim()
        hospital = hospital.trim()

        if (age == "" || hospital == "" || age == null || hospital == null){
            alert("请填写完整本人癌症史")
            return false
        }
    }


    //————————————————————————————家属肠癌史栏目
    //获得Family-disease单选框提交时的状态
    var radios = document.getElementsByName("Family-disease");
    //声明标识符
    var flag = false;
    var info = false;

    for (var i = 0; i < radios.length; i++) {
        //判断那个单选按钮为选中状态
        if (radios[i].checked) {
            //弹出选中单选按钮的值
            //alert(radios[i].value);
            flag = true;
            if (radios[i].value == "有"){
                info = true
            }
        }
    }

    if (!flag) {
        alert("请选择家庭肠癌史,至少选择一个")
        return false;
    }

    if (info){
        var name = document.getElementsByName("relative-name")[0].value
        var age = document.getElementsByName("cancer-age")[1].value

        name = name.trim()
        age = age.trim()

        if (name == "" || name == null || age == "" || age == null){
            alert("请填写完整家庭肠癌史")
            return false
        }

        var radio = document.getElementsByName("alive")
        var alive = false

        for (var i = 0; i < radio.length; i++) {
            //判断那个单选按钮为选中状态
            if (radios[i].checked) {
                //弹出选中单选按钮的值
                //alert(radios[i].value);
                alive = true;
            }
        }

        if (!alive){
            alert("请填写完整家庭肠癌史")
            return false
        }
    }
    return true
}

$(function() {// 初始化内容

    var date = new Date();

    var str = "";

    str += date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()

    console.log(str)

    $("#time").attr("value" , str)

});