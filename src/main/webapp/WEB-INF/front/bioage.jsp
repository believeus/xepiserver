<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>生物学年龄检测</title>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 22px;">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="header" style="width: 100%;height: auto;">
		<img src="static/images/bio-1.jpg"style="width: 100%;"height="auto"/>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;line-height: 22px;">别再用生日或蛋糕上的蜡烛、皱纹、鱼尾纹或脸上的皱眉线来计算你的年龄——这些只是数字而已。今天，这些数字都不算数！</div>
		<div style="width: 100%;height: 15px;"></div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				你多大了？为什么很重要？
			</div>
			<div style="width: 100%;height: auto;">
				<div>• 人们衰老的速度不同。有些人“看起来”和“感觉”比他们的实际年龄大，而另一些人看起来比他们的实际年龄小。</div>
				<div>• 我们的生物学年龄比我们的实际年龄更能反映我们的健康状况和寿命。</div>
				<div>• DNA是硬件，遗传学是操作系统，DNA甲基化和其他表观遗传因素是编程基因组的软件。</div>
				<div>• Horvath发现了“表观遗传时钟”，这是基于DNA中500个战略位置的DNA甲基化状态的测量，从而在生物年龄标记的搜索中发生了范式转变。</div>
				<div>• 研究表明，加速的“表观遗传时钟”可能与多个年龄相关慢性疾病（如心血管疾病和晚期癌症）的风险增加有关。（链接：https://www.ncbi.nlm.nih.gov/pubmed/?term=epigenetic+clock+disease）。然而，这仍然是一个开放的领域，同时也需要更多的研究。</div>
				<div>• 重要的是，“表观遗传学”不同于“遗传学”，通过饮食干预和生活方式的改变可能是可逆的。</div>
				<div>• 初步研究表明，饮食改变可能导致某些人的表观遗传时钟减慢，但这仍然是一种开放的生活。（链接：https://www.ncbi.nlm.nih.gov/pubmed/30350398）</div>
				<div>• 生活方式的改变，包括运动和饮食习惯的改变，已经被国家医学协会推荐了一段时间，但是我们需要更多关于最可取的改变的数据，并且这个改变应该是个性化的。</div>
				<div>• 一个可以让我们更了解明智生活方式改变的方法是与他人分享我们的经验和分析生活方式差异的影响。而现在我们就可以使用应用程序和人工智能等共享技术来做到这一点。</div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				什么是生物学年龄检测？
			</div>
			<div style="width: 100%;height: auto;">
				<div>• 在广泛的数据挖掘之后，我们发现了一个与年龄相关的CG甲基化区域，足以通过唾液准确预测生物学年龄。</div>
				<div>• 尽管目前尚不清楚如何减缓大多数国家医学协会建议的年龄-生活方式变化，但这或许是一个开始。生物学年龄大于实际年龄就意味着“红点”，这并不意味着是时候改变生活方式了。</div>
				<div>• 我们认为这个“红点”是一个“表观遗传年龄”，它比测试的一个标准差还要老。标准差提供了一个关于正常人群分布的概念，在这个分析点上是5年。随着测试的积累，我们将得到一个更准确的“正态分布”的数字。</div>
				<div>• 一个“红点”可能会促使你按照自己的生活方式做出相应改变。</div>
				<div>• 我们的应用程序将链接到重要的美国国家医学协会推荐的生活方式行为信息。这些是定期更新的，我们建议您通过定期检查链接来保持更新。这些建议是基于“科学”今天所知道的，它们并不完美。但随着更多的数据和更多的分析，我们的科学也在改进提升。 </div>
				<div>• 您决定是否定期更新改应用上生活方式的数据，跟新部分或所有信息。然而，我们相信更准确的问卷数据将提供更准确、适合的分析报告。</div>
				<div>• 最初，我们的报告将显示您的生活方式参数与共识建议的差距。您的数据将被匿名化，您的数据和来自其他匿名用户的数据将由人工智能进行分析，以开发一个基于许多用户的模型，该模型可测量生活方式变化对“表观遗传时钟”的影响。随着时间的推移，越来越多的数据被积累起来，这个模型将被用在你的生活方式数据上，“模型”的结果将被分享给你。</div>
				<div>• 我们的测试管理简单、成本低、功能强大且准确，并动态集成到由应用程序技术和机器学习驱动的终身健康生态系统中。</div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				生物学年龄检测是如何工作的？
			</div>
			<div style="width: 100%;height: auto;">
				<div>• 通过HKG Epiaging应用程序订购Epiaging套件。</div>
				<div>• 套件将通过快递发送给您。</div>
				<div>• 扫描套件中包含的唯一条形码。</div>
				<div>• 按照说明将唾液收集到收集管中。</div>
				<div>• 将工具箱装回提供的信封袋中。</div>
				<div>• 登录应用程序查看测试结果。 </div>
				<div>• 向我们提供您的健康和生活方式信息，以建立您的个性化健康生态系统。</div>
				<div>• 您将在应用程序中接收生活数据的实时分析。测试完成后，您将收到结果。</div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				为什么你在应用程序中需要填写调查问卷？
			</div>
			<div style="width: 100%;height: auto;">
				<div>• 生物学年龄检测仅在动态的终身模式、环境和健康管理系统中有意义。</div>
				<div>• 根据您提供的健康和生活方式信息，将生成包括干预在内的个性化评估。</div>
				<div>• 定期更新您的健康和生活方式参数，以激活终身个性化分析报告</div>
				</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				数据将如何被使用？
			</div>
			<div style="width: 100%;height: auto;">
				<div>• 使用最先进的机器学习算法，持续分析多个用户的表观测试结果、一般健康参数、个人干预及其结果。</div>
				<div>• 个性化分析，提供一些可能的改进途径。</div>
				<div>• 共同致力于您的福祉和我们的“随机应变”学习环境。</div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				你的生物学年龄是唯一重要的年龄
			</div>
			<div style="font-weight: 600;font-size: 18px; line-height: 40px;">
				每个人都有一个生物学年龄时钟
			</div>
			<div style="width: 100%;height: auto;">
				<div>我们都知道自己的实际年龄。但我们真的和我们的生物学年龄一样大吗？</div>
				<div style="line-height: 22px;">人们衰老的速度不同。一些人“看起来”和“感觉”比实际年龄大，而另一些人看起来比实际年龄小。而我们的生物学年龄比我们的实际年龄更能反映我们的健康状况和寿命。</div>
			</div>
			<div style="width: 100%;height: auto;"><img src="static/images/bio-2.png"style="width: 100%;height: auto;"/></div>
		</div>
	</div>

	<%--<div class="content" style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 94%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Our Biological age is a better parameter of our health well being and life span than our chronological age.
			</div>
			<div style="width: 100%;height: auto;font-size: 18px;font-weight: 500;line-height: 80px;">But how do we know our "biological age"?  </div>
			<div style="line-height: 22px;">It has been believed that if we can define the true "biological age" we might test and design interventions that will decelerate the rate of biological aging.
				During the past decades, extensive effort has been invested in identifying different parameters that could predict "biological aging" and life span such as measures of frailty, graying of hair, aging of skin, levels of different kinds of white blood cells.
				However most of these markers were found to offer no advantage over knowing your chronological age.
			</div>
			<div style="width: 100%;height: 30px;"></div>
			<div style="width:80%;margin: 0 auto; height: auto; font-size:18px;color: #0071BC;text-align: center;line-height: 20px;">
				Parameters that predict "biological aging" and longevity
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div><img src="static/images/bio-3.png"style="width: 100%;height: auto;"/></div>
		</div>
	</div>--%>

	<div class="method" style="width: 100%;height: auto;background-color: #F4F4F4;">
		<div style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;text-align: center;color: #0071BC;font-size: 18px;line-height: 80px;">
				但是如何知道我们的“生物学年龄”呢？
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 33%;height: auto;"></div>
				<div style="width: 24%;height: auto; margin: 0 auto;text-align: center;"><img src="static/images/bio-4.png"style="width: 100%;height: auto;"/></div>
				<div style="width: 33%;height: auto;"></div>
			</div>
			<div style="width: 100%;height: auto;color: #899F54;text-align: center;">
				端粒长度
			</div>
			<div style="width: 100%;height: auto;text-align: center;line-height: 20px;color: #666666;">
				<div>低相关</div>
				<div>高技术要求</div>
				<div>细微技术错误可能对 </div>
				<div>结果具有决定性的影响</div>
			</div>
			<div style="width: 100%;height:20px;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 33%;height: auto;"></div>
				<div style="width: 24%;height: auto; margin: 0 auto;text-align: center;">
					<img src="static/images/bio-6.png"style="width: 100%;height: auto;"/></div>
				<div style="width: 33%;height: auto;"></div>
			</div>
			<div style="width: 100%;height: auto;color: #FBA32E;text-align: center;">
				代谢年龄评分
			</div>
			<div style="width: 80%;height: auto;margin: 0 auto; text-align: center;line-height: 20px;color: #666666;">
				<div>抽样检测方法复杂，在大量人群样本中尚未得到验证</div>
			</div>

			<div style="width: 90%;margin: 0 auto; height: auto;background-color:#29ABE2 ; border-radius: 5px;">
				<div style="width: 100%;height: 10px;"></div>
				<div style="width: 100%;height: auto;">
					<div style="width: 33%;height: auto;"></div>
					<div style="width: 24%;height: auto; margin: 0 auto;text-align: center;">
						<img src="/static/images/bio-7.png"style="width: 100%;height: auto;"/></div>
					<div style="width: 33%;height: auto;"></div>
				</div>
				<div style="width: 100%;height: auto;color: #FBA32E;text-align: center;color: #FFFFFF;">
					<i>表观遗传时钟</i>
				</div>
				<div style="width: 90%;height: auto;margin: 0 auto; text-align: center;line-height: 20px;color: #FFFFFF;">
					<div>与人体的生物学功能密切相关，表观遗传时钟的加速与神经退行性疾病和癌症的风险有关。</div>
				</div>
			</div>
		</div>
	</div>

	<div class="epitherapia" style="width: 100%;height: auto">
		<div style="width: 94%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;color: #0071BC;font-weight: 500;font-size: 20px;">
				<i>生物学年龄检测</i>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				<i>生物学年龄检测 </i>生物学年龄检测使用一种称为DNA甲基化的方法来确定你的真实年龄——正如科学在这个时代的这个时间所想的那样，这可能会揭示一些关于你真实健康的重要信息，甚至你的生活质量和寿命。
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				<i>香港精准医学有限公司</i> 在DNA甲基化这个令人兴奋的领域已经有三十年的开拓性研究。通过我们独特的诊断唾液中储存在细胞中的DNA甲基化的方法，我们可以揭示你的实际年龄，这可能会鼓励你改变生活方式，一些证据表明这可能带来以下结果:
			</div>
			<div style="width: 100%;height: 30px;"></div>
			<div style="line-height: 80px;"><img src="static/images/bio10.png"style="width: 100%;height: auto;"/></div>
		</div>
	</div>
	<div style="width: 100%;height: 30px;"></div>
	<div class="simple"style="width: 100%;height: auto;background-color: #F4F4F4;">
		<div style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				使科学变得简单
			</div>
			<div style="line-height: 60px; ">
				你的生物学时钟有多快？
			</div>
			<div style="line-height: 22px;">
				如果你的年龄是50岁，而你的生物学年龄是35岁，那就太好了！
				但是，如果你的年龄是35岁，而你的生物学年龄表明你已经50岁了——这可能是你需要及时改变生活方式的警钟。
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px; ">
				生物学年龄大于实际年龄可能会增加患重病的风险。表观遗传学也许不是青春之泉，但却是生命之泉。
			</div>
			<div style="width: 100%;height:20px ;"></div>
			<div style=" line-height: 22px;">
				所以把握时机，了解你的生物学年龄，真的！
			</div>
			<div>
				<img src="static/images/cn-bio8.png"style="width: 100%;height: auto;"/>
			</div>
		</div>
	</div>

	<div style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;">
			<div style="height: auto;color: #0071BC;font-weight: 500;font-size: 20px;line-height: 60px;">
				生物学年龄检测
			</div>
			<div style="width: 100%;height: auto;line-height: 22px;">
				我们开发了一种方便有效的生物学年龄检测试验。
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				香港精准医学的科学家在数百份已发表的DNA甲基化数据中挖掘了大量与年龄相关的cg甲基化位点，并选择了一个含有13个甲基化位点的区域，唾液样本可以准确预测生物年龄。
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="height: auto;color: #0071BC;font-weight: 500;font-size: 16px;line-height: 30px;">
				你的生活方式和健康
			</div>
			<div style="height: auto;color: #0071BC;font-weight: 500;font-size: 16px;line-height: 30px;">
				共享数据和分析
			</div>
			<div style="line-height: 22px;">
				生物学年龄检测只有在一个动态的终身生活方式的管理中才有意义。由最著名的国家医学协会提供的科学建议在问题部分。您输入数据，然后决定要根据哪些建议采取行动。
您可以使用我们的“全盲”应用程序与我们分享数据和决策。您也可以根据需要经常输入或更改数据。
多个用户的数据和结果使用最先进的机器学习进行持续分析，并为您提供个性化分析报告，以提供一些可能的健康改善途径。
医学不是绝对的科学。我们从来都不是完美的，但我们正试图通过对数据的迭代分析来改进。
我们认为我们的平台是一个“持续迭代”的平台，随着使用不断扩展的数据体而动态改进。
			</div>

			<div style="width: 100%;height: 40px;"></div>
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				通过以下5个简单的步骤 <br />发现你的生物学年龄，改变你的生活方式，改善你的健康！
			</div>

			<div style="width: 100%;height: auto;margin-top: 30px;">
				<img src="static/images/bio-9.png"style="width: 100%;height: auto;"/>
			</div>
		</div>
	</div>
	<div style="width: 100%;height: 40px;"></div>
	<%--<div class="download"style="width: 100%;height: auto;">--%>
		<%--<div style="width: 90%;height: 40px;margin: 0 auto;color: #FFFFFF;background-color: #0071BC;text-align: center;line-height: 40px;border-radius: 5px;">Download APP</div>--%>
	<%--</div>--%>
	<div style="width: 100%;height: 60px;"></div>
	<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 70px;">
			@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
		</div>
	</div>
	<jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
