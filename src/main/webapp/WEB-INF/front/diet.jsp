<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Diet Recommendation</title>
	</head>
	<body style="padding: 0;margin: 0;">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="container" style="width: 100%;height: 100%;">
			<div style="width: 100%;height: auto;">
			<div class="food" style="width: 90%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
				<div style="width: 100%;height: 30px;"></div>
				<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">
					Food Consumption (calories/day)
				</div>
				<div style="width: 100%;height: auto;font-size: 14px; font-family: airal;color: #666666;">
					<a href="https://www.nhlbi.nih.gov/health/educational/lose_wt/eat/calories.htm">Source: National Heart, Lung, and Blood Institute</a>
				</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
					<strong> Recommendation: </strong>Eating plans that contain 1,200–1,500 calories each day will help most women lose weight safely. Eating plans that contain 1,500–1,800 calories each day are suitable for men and for women who weigh more or who exercise regularly.
				</div>
				<div style="width: 100%;height: 20px; "></div>
			</div>
			</div>
			<div style="width: 100%;height: auto;font-size: 16px;font-family: arial;color: #666666;">
				<div style="width: 90%;height: 40px;font-size: 12px;margin: 0 auto;">* 1 cup = ~250 milliliters, 1 table spoon = 14.2 gram</div>
				<div style="width: 90%;height: auto;margin: 0 auto;font-weight: 700;">Breakfast</div>
	<select class="form-control selectpicker" data-live-search="true" multiple style="width: 300px;height: 400px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 210px;" >
        <optgroup label="Fruit">
                <option value="f1">Apple</option>
                <option value="f2">Banana</option>
                <option value="f3">Grapes</option>
                <option value="f4">Orange</option>
                <option value="f5">Pear</option>
                <option value="f6">Peach</option>
                <option value="f7">Pineapple</option>
                <option value="f8">Strawberry</option>
                <option value="f9">Watermelon</option>
                <option value="f10">Avocados</option>
                <option value="f11">Berries</option>
                <option value="f12">Cherries</option>
                <option value="f13">Kiwis</option>
                <option value="f14">Lemons / Limes</option>
                <option value="f15">Nectarines</option>
                <option value="f16">Plums</option>
         </optgroup>   
          <optgroup label="Vegetables">
                  <option value="v1">Asparagus</option>
                  <option value="v2">Broccoli</option>
                  <option value="v3">Carrots</option>
                  <option value="v4">Cucumber</option>
                  <option value="v5">Eggplant</option>
                  <option value="v6">Lettuce</option>
                  <option value="v7">Tomato</option>
           </optgroup>  
            <optgroup label="Cheese">
                  <option value="c1">Bleu cheese</option>
                  <option value="c2">Cheddar</option>
                  <option value="c3">Cottage cheese</option>
                  <option value="c4">Cream cheese</option>
                  <option value="c5">Feta</option>
                  <option value="c6">Goat cheese</option>
                  <option value="c7">Mozzarella</option>
                  <option value="c8">Parmean</option>
                  <option value="c9">Provolone</option>
                  <option value="c10">Ricotta</option>
                  <option value="c11">Sandwich slices</option>
                  <option value="c12">Swiss</option>
           </optgroup>  
         <optgroup label="Proteins">
                   <option value="p1">Beef, regular, cooked</option>
                   <option value="p2">Chicken, cooked</option>
                   <option value="p3">Tofu</option>
                   <option value="p4">Egg</option>
                   <option value="p5">Fish, Catfish, cooked</option>
                   <option value="p6">Pork, cooked</option>
                   <option value="p7">Shrimp, cooked</option>
             </optgroup>    
               <optgroup label="Seafood">
                   <option value="s1">Catfish</option>
                   <option value="s2">Crab</option>
                   <option value="s3">Lobster</option>
                   <option value="s4">Mussels</option>
                   <option value="s5">Oysters</option>
                   <option value="s6">Salmon</option>
                   <option value="s7">Shrimp</option>
                   <option value="s8">Tilapia</option>
                   <option value="s9">Tuna</option>
             </optgroup>  
              <optgroup label="Common Meals/Snacks">
                  <option value="c1">Bread, white</option>
                  <option value="c2">Butter</option>
                  <option value="c3">Caesar salad</option>
                  <option value="c4">Cheeseburger</option>
                  <option value="c5">Hamburger</option>
                  <option value="c6">Dark Chocolate</option>
                  <option value="c7">Corn</option>
                  <option value="c8">Pizza</option>
                  <option value="c9">Potato</option>
                  <option value="c10">Rice</option>
             </optgroup>   
             <optgroup label="Beverages/Dairy">
                   <option value="b1">Beer</option>
                   <option value="b2">Coca-Cola Classic</option>
                   <option value="b3">Diet Coke</option>
                   <option value="b4">Milk (1%)</option>
                   <option value="b5">Milk (2%)</option>
                   <option value="b6">Milk (Whole)</option>
                   <option value="b7">Orange Juice</option>
                   <option value="b8">Apple cider</option>
                   <option value="b9">Yogurt (low-fat)</option>
                   <option value="b10">Yogurt (non-fat)</option>
                   <option value="b11">Club soda / Tonic</option>
                   <option value="b12">Champagne</option>
                   <option value="b13">Gin</option>
                   <option value="b14">Mixers</option>
                   <option value="b15">Red wine / White wine</option>
                   <option value="b16">Rum</option>
                   <option value="b17">Saké</option>
                   <option value="b18">Soda pop</option>
                   <option value="b19">Sports drink</option>
                   <option value="20">Whikey</option>
                   <option value="21">Vodka</option>
             </optgroup> 
</select>
<div style="width: 100%;height: 40px;"></div>
<div style="width: 90%;height: auto;margin: 0 auto;font-weight: 700;">Lunch</div>
	<select class="form-control selectpicker" data-live-search="true" multiple style="width: 300px;height: 400px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 210px;" >
        <optgroup label="Fruit">
                <option value="f1">Apple</option>
                <option value="f2">Banana</option>
                <option value="f3">Grapes</option>
                <option value="f4">Orange</option>
                <option value="f5">Pear</option>
                <option value="f6">Peach</option>
                <option value="f7">Pineapple</option>
                <option value="f8">Strawberry</option>
                <option value="f9">Watermelon</option>
                <option value="f10">Avocados</option>
                <option value="f11">Berries</option>
                <option value="f12">Cherries</option>
                <option value="f13">Kiwis</option>
                <option value="f14">Lemons / Limes</option>
                <option value="f15">Nectarines</option>
                <option value="f16">Plums</option>
         </optgroup>   
          <optgroup label="Vegetables">
                  <option value="v1">Asparagus</option>
                  <option value="v2">Broccoli</option>
                  <option value="v3">Carrots</option>
                  <option value="v4">Cucumber</option>
                  <option value="v5">Eggplant</option>
                  <option value="v6">Lettuce</option>
                  <option value="v7">Tomato</option>
           </optgroup>  
            <optgroup label="Cheese">
                  <option value="c1">Bleu cheese</option>
                  <option value="c2">Cheddar</option>
                  <option value="c3">Cottage cheese</option>
                  <option value="c4">Cream cheese</option>
                  <option value="c5">Feta</option>
                  <option value="c6">Goat cheese</option>
                  <option value="c7">Mozzarella</option>
                  <option value="c8">Parmean</option>
                  <option value="c9">Provolone</option>
                  <option value="c10">Ricotta</option>
                  <option value="c11">Sandwich slices</option>
                  <option value="c12">Swiss</option>
           </optgroup>  
         <optgroup label="Proteins">
                   <option value="p1">Beef, regular, cooked</option>
                   <option value="p2">Chicken, cooked</option>
                   <option value="p3">Tofu</option>
                   <option value="p4">Egg</option>
                   <option value="p5">Fish, Catfish, cooked</option>
                   <option value="p6">Pork, cooked</option>
                   <option value="p7">Shrimp, cooked</option>
             </optgroup>    
               <optgroup label="Seafood">
                   <option value="s1">Catfish</option>
                   <option value="s2">Crab</option>
                   <option value="s3">Lobster</option>
                   <option value="s4">Mussels</option>
                   <option value="s5">Oysters</option>
                   <option value="s6">Salmon</option>
                   <option value="s7">Shrimp</option>
                   <option value="s8">Tilapia</option>
                   <option value="s9">Tuna</option>
             </optgroup>  
              <optgroup label="Common Meals/Snacks">
                  <option value="c1">Bread, white</option>
                  <option value="c2">Butter</option>
                  <option value="c3">Caesar salad</option>
                  <option value="c4">Cheeseburger</option>
                  <option value="c5">Hamburger</option>
                  <option value="c6">Dark Chocolate</option>
                  <option value="c7">Corn</option>
                  <option value="c8">Pizza</option>
                  <option value="c9">Potato</option>
                  <option value="c10">Rice</option>
             </optgroup>   
             <optgroup label="Beverages/Dairy">
                   <option value="b1">Beer</option>
                   <option value="b2">Coca-Cola Classic</option>
                   <option value="b3">Diet Coke</option>
                   <option value="b4">Milk (1%)</option>
                   <option value="b5">Milk (2%)</option>
                   <option value="b6">Milk (Whole)</option>
                   <option value="b7">Orange Juice</option>
                   <option value="b8">Apple cider</option>
                   <option value="b9">Yogurt (low-fat)</option>
                   <option value="b10">Yogurt (non-fat)</option>
                   <option value="b11">Club soda / Tonic</option>
                   <option value="b12">Champagne</option>
                   <option value="b13">Gin</option>
                   <option value="b14">Mixers</option>
                   <option value="b15">Red wine / White wine</option>
                   <option value="b16">Rum</option>
                   <option value="b17">Saké</option>
                   <option value="b18">Soda pop</option>
                   <option value="b19">Sports drink</option>
                   <option value="20">Whikey</option>
                   <option value="21">Vodka</option>
             </optgroup> 
</select>
<div style="width: 100%;height: 40px;"></div>
<div style="width: 90%;height: auto;margin: 0 auto;font-weight: 700;">Dinner</div>
	<select class="form-control selectpicker" data-live-search="true" multiple style="width: 300px;height: 400px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 210px;" >
        <optgroup label="Fruit">
                <option value="f1">Apple</option>
                <option value="f2">Banana</option>
                <option value="f3">Grapes</option>
                <option value="f4">Orange</option>
                <option value="f5">Pear</option>
                <option value="f6">Peach</option>
                <option value="f7">Pineapple</option>
                <option value="f8">Strawberry</option>
                <option value="f9">Watermelon</option>
                <option value="f10">Avocados</option>
                <option value="f11">Berries</option>
                <option value="f12">Cherries</option>
                <option value="f13">Kiwis</option>
                <option value="f14">Lemons / Limes</option>
                <option value="f15">Nectarines</option>
                <option value="f16">Plums</option>
         </optgroup>   
          <optgroup label="Vegetables">
                  <option value="v1">Asparagus</option>
                  <option value="v2">Broccoli</option>
                  <option value="v3">Carrots</option>
                  <option value="v4">Cucumber</option>
                  <option value="v5">Eggplant</option>
                  <option value="v6">Lettuce</option>
                  <option value="v7">Tomato</option>
           </optgroup>  
            <optgroup label="Cheese">
                  <option value="c1">Bleu cheese</option>
                  <option value="c2">Cheddar</option>
                  <option value="c3">Cottage cheese</option>
                  <option value="c4">Cream cheese</option>
                  <option value="c5">Feta</option>
                  <option value="c6">Goat cheese</option>
                  <option value="c7">Mozzarella</option>
                  <option value="c8">Parmean</option>
                  <option value="c9">Provolone</option>
                  <option value="c10">Ricotta</option>
                  <option value="c11">Sandwich slices</option>
                  <option value="c12">Swiss</option>
           </optgroup>  
         <optgroup label="Proteins">
                   <option value="p1">Beef, regular, cooked</option>
                   <option value="p2">Chicken, cooked</option>
                   <option value="p3">Tofu</option>
                   <option value="p4">Egg</option>
                   <option value="p5">Fish, Catfish, cooked</option>
                   <option value="p6">Pork, cooked</option>
                   <option value="p7">Shrimp, cooked</option>
             </optgroup>    
               <optgroup label="Seafood">
                   <option value="s1">Catfish</option>
                   <option value="s2">Crab</option>
                   <option value="s3">Lobster</option>
                   <option value="s4">Mussels</option>
                   <option value="s5">Oysters</option>
                   <option value="s6">Salmon</option>
                   <option value="s7">Shrimp</option>
                   <option value="s8">Tilapia</option>
                   <option value="s9">Tuna</option>
             </optgroup>  
              <optgroup label="Common Meals/Snacks">
                  <option value="c1">Bread, white</option>
                  <option value="c2">Butter</option>
                  <option value="c3">Caesar salad</option>
                  <option value="c4">Cheeseburger</option>
                  <option value="c5">Hamburger</option>
                  <option value="c6">Dark Chocolate</option>
                  <option value="c7">Corn</option>
                  <option value="c8">Pizza</option>
                  <option value="c9">Potato</option>
                  <option value="c10">Rice</option>
             </optgroup>   
             <optgroup label="Beverages/Dairy">
                   <option value="b1">Beer</option>
                   <option value="b2">Coca-Cola Classic</option>
                   <option value="b3">Diet Coke</option>
                   <option value="b4">Milk (1%)</option>
                   <option value="b5">Milk (2%)</option>
                   <option value="b6">Milk (Whole)</option>
                   <option value="b7">Orange Juice</option>
                   <option value="b8">Apple cider</option>
                   <option value="b9">Yogurt (low-fat)</option>
                   <option value="b10">Yogurt (non-fat)</option>
                   <option value="b11">Club soda / Tonic</option>
                   <option value="b12">Champagne</option>
                   <option value="b13">Gin</option>
                   <option value="b14">Mixers</option>
                   <option value="b15">Red wine / White wine</option>
                   <option value="b16">Rum</option>
                   <option value="b17">Saké</option>
                   <option value="b18">Soda pop</option>
                   <option value="b19">Sports drink</option>
                   <option value="20">Whikey</option>
                   <option value="21">Vodka</option>
             </optgroup> 
</select>
			
			</div>
			
			<div style="width: 100%;height: auto;">
				<div style="width: 100%;height: 60px;font-family: arial;overflow: hidden;"></div>
				<div style="width: 90%;height: auto;margin: 0 auto;overflow: hidden;">
					<div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">2000, 1500, and 1200 Calorie Sample Meal Plans</div>
					<div style="width: 100%;height: 30px;border: 1px solid grey;font-size: 18px;font-weight: 600; text-align: center;border: 1px solid grey;background-color: #E0F0FE;">Breakfast</div>
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 130px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							1200 Cal Plan
						</div>
						<div style="width: 45%;height: 130px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">All-bran cereal (125)<br /> Milk (50)<br /> Banana (90)<br /><strong> Snack :</strong><br /> Cucumber (30)<br /> Avocado dip (50) </div>
						<div style="width: 25%;height: 130px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							Total: 345 Calories 
						</div>
					</div>
					
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 120px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							1500 Cal Plan
						</div>
						<div style="width: 45%;height: 120px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Granola (120)<br />Greek yogurt (120)<br />Blueberries (40)<br /><strong> Snack :</strong><br /> Orange (70)
						</div>
						<div style="width: 25%;height: 120px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							Total: 350 Calories 
						</div>
					</div>
					
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 150px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 60px;"></div>
							2000 Cal Plan
						</div>
						<div style="width: 45%;height: 150px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Buttered toast (150)<br /> Egg (80<br /> Banana (90)<br />Almonds (170)<br /> <strong> Snack :</strong><br /> Greek yogurt (120)<br /> Blueberries (40)
						</div>
						<div style="width: 25%;height: 150px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 60px;"></div>
							Total: 650 Calories 
						</div>
					</div>
					
					<div style="width: 100%;height: auto;margin: 0 auto;overflow: hidden;">
					<div style="width: 100%;height: 30px;border: 1px solid grey;font-size: 18px;font-weight: 600; text-align: center;border: 1px solid grey;background-color: #E0F0FE;">Lunch</div>
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 120px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							1200 Cal Plan
						</div>
						<div style="width: 45%;height: 120px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Grilled cheese with tomato (300)<br /> Salad (50)<br /><strong> Snack :</strong><br />Walnuts (100) 
						</div>
						<div style="width: 25%;height: 120px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							Total: 450 Calories 
						</div>
					</div>
					
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 135px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							1500 Cal Plan
						</div>
						<div style="width: 45%;height: 135px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Chicken and vegetable soup (300)<br />Bread (100)<br /><strong> Snack :</strong><br /> Apple (75) <br />Peanut butter (75)
						</div>
						<div style="width: 25%;height: 135px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							Total: 550 Calories 
						</div>
					</div>
					
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 150px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							2000 Cal Plan
						</div>
						<div style="width: 45%;height: 150px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Grilled chicken (225)<br />Grilled vegetables (125)<br /> Pasta (185)<br /> <strong> Snack :</strong><br />Hummus (50)<br /> Baby carrots (35)<br /> Crackers (65)
						</div>
						<div style="width: 25%;height: 150px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							Total: 685 Calories 
						</div>
					</div>
					</div>
					
					<div style="width: 100%;height: auto;margin: 0 auto;overflow: hidden;">
					<div style="width: 100%;height: 30px;border: 1px solid grey;font-size: 18px;font-weight: 600; text-align: center;border: 1px solid grey;background-color: #E0F0FE;">Dinner</div>
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 80px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 33px;"></div>
							1200 Cal Plan
						</div>
						<div style="width: 45%;height: 80px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Grilled Chicken (200)<br /> Brussel sprouts (100)<br />Quinoa (105)<br />
						</div>
						<div style="width: 25%;height: 80px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 22px;"></div>
							Total: 405 Calories 
						</div>
					</div>
					
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 75px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 29px;"></div>
							1500 Cal Plan
						</div>
						<div style="width: 45%;height: 75px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Steak (375)<br />Mashed potatoes (150)<br />Asparagus (75)<br /> 
						</div>
						<div style="width: 25%;height: 75px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 21px;"></div>
							Total: 600 Calories 
						</div>
					</div>
					
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: 100px;float: left;border: 1px solid grey; border-width: 0 0 1px 1px;text-align: center;font-weight: 700;">
							<div style="width: 100%;height: 40px;"></div>
							2000 Cal Plan
						</div>
						<div style="width: 45%;height: 100px;float: left;border: 1px solid grey;border-width: 0 0 1px 1px;">
							Grilled salmon (225)<br />Brown rice (175)<br />Green beans (100)<br />Walnuts (165) 
						</div>
						<div style="width: 25%;height: 100px;float: left;text-align: center; border:1px solid grey ;border-width: 0 1px 1px 1px;font-weight: 700;">
							<div style="width: 100%;height: 34px;"></div>
							Total: 665 Calories 
						</div>
					</div>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 60px;font-family: arial;overflow: hidden;"></div>
				<div style="width: 90%;height: auto;margin: 0 auto;overflow: hidden;">
					<div style="width: 100%;height: 60px;font-size: 18px;font-weight: 600; ">Calories Burned from Common Exercises:</div>
					
					
					<div style="width: 100%;height: auto;background-color: #E0F0FE;font-size: 18px;color: #666666;font-weight: 700;overflow: hidden;">
						<div style="width: 40%;height: 55px;float: left;border: 1px solid grey; border-width: 1px 0 1px 1px;text-align: center;font-weight: 700;">Activity <br /> (1 hour)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;border: 1px solid grey;border-width: 1px 0 1px 1px;">125 lb person</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center; border:1px solid grey ;border-width: 1px 0 1px 1px;">155 lb person</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center; border:1px solid grey ;border-width: 1px 1px 1px 1px;">185 lb person</div>
					</div>
				 	<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;">
						<div style="width: 40%;height: 55px;float: left;text-align: center;border: 1px solid grey; border-width: 1px 0 1px 1px;">Golf <br /> (using cart)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">	198</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">246</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">294</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;background-color: #EEEEEE;">
						<div style="width: 40%;height: 55px;float: left;text-align: center;border: 1px solid grey; border-width: 1px 0 1px 1px;">Walking <br />(3.5 mph)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">215</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">267</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">	319</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;">
						<div style="width: 40%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey; border-width: 1px 0 1px 1px;">Kayaking	</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">283</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">352</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">420</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;background-color: #EEEEEE;">
						<div style="width: 40%;height: 55px;float: left;text-align: center; border: 1px solid grey; border-width: 1px 0 1px 1px;">Softball/<br /> Baseball</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">289</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">359</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">428</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;">
						<div style="width: 40%;height: 81px;float: left;text-align: center; border: 1px solid grey; border-width: 1px 0 1px 1px;">Swimming <br /> (free-style, moderate)</div>
						<div style="width: 20%;height: 81px;float: left;text-align: center;line-height: 81px; border: 1px solid grey;border-width: 1px 0 1px 1px;">397</div>
						<div style="width: 20%;height: 81px;float: left;text-align: center;line-height: 81px; border:1px solid grey ;border-width: 1px 0 1px 1px;">492</div>
						<div style="width: 20%;height: 81px;float: left;text-align: center;line-height: 81px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">587</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;background-color: #EEEEEE;">
						<div style="width: 40%;height: 55px;float: left;text-align: center; border: 1px solid grey; border-width: 1px 0 1px 1px;">Tennis <br /> (general)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">397</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">492</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">587</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;">
						<div style="width: 40%;height: 55px;float: left;text-align: center; border: 1px solid grey; border-width: 1px 0 1px 1px;">Running <br /> (9 minute mile)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">624</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">773</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">923</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;background-color: #EEEEEE;">
						<div style="width: 40%;height: 81px;float: left;text-align: center; border: 1px solid grey; border-width: 1px 0 1px 1px;">Bicycling <br /> (12-14 mph, moderate)</div>
						<div style="width: 20%;height: 81px;float: left;text-align: center;line-height: 81px; border: 1px solid grey;border-width: 1px 0 1px 1px;">454</div>
						<div style="width: 20%;height: 81px;float: left;text-align: center;line-height: 81px; border:1px solid grey ;border-width: 1px 0 1px 1px;">562</div>
						<div style="width: 20%;height: 81px;float: left;text-align: center;line-height: 81px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">671</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;">
						<div style="width: 40%;height: 55px;float: left;text-align: center; border: 1px solid grey; border-width: 1px 0 1px 1px;">Football <br /> (general)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">399</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">494</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">588</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;background-color: #EEEEEE;">
						<div style="width: 40%;height: 55px;float: left;text-align: center; border: 1px solid grey; border-width: 1px 0 1px 1px;">Basketball<br />  (general)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">340</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">422</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">503</div>
					</div>
					<div style="width: 100%;height: auto;font-size: 18px;color: #666666;overflow: hidden;">
						<div style="width: 40%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey; border-width: 1px 0 1px 1px;">Soccer<br />(general)</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border: 1px solid grey;border-width: 1px 0 1px 1px;">397</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 0 1px 1px;">492</div>
						<div style="width: 20%;height: 55px;float: left;text-align: center;line-height: 55px; border:1px solid grey ;border-width: 1px 1px 1px 1px;">587</div>
					</div>
				</div>
					
					
			<div style="width: 100%;height: 60px;"></div>
				<div id="all-right"style="width: 90%;height: auto;font-family: arial;margin: 0 auto;">
					<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
						@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
					</div>
				</div>
            <jsp:include page="footnav.jsp"></jsp:include>
		</div>
	</body>
</html>
