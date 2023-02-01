//////////////SIMPLE PROGRESS BAR FUNCTION

//How to use , first of all make an object with a vlue like health then call
//the function . :
//   px = is the location of x where the top left corner will be located 
//	 py = is the location of y where the bottome left corner will be located 
//	 pwidth = is the width of the progress bar
//	 pvalue = here pass the variable of the value you want to represent in the porgress bar
//	 color_Progress = is the color that will represent the precentage of the value 
//	 color_background = is the color that will be behind the color_Progress
//	 color_Outline = is the color that will outline the progress bar 
//   
//
//   The Second Function 
//   Use A Text Variable If Needed And put \n for each new line there's no reset function yet , 
//
//
//
//   Made By : rayanm -> you don't have to credit me on anything...
/////////////////////

function gel_progressbar(px,py,pwidth,phowtall,pvalue,color_Progress,color_background,outline,color_Outline,color_label,font_label,label){
	
	//background of progress bar 
	if(pvalue >0)
	{
	if(outline ==1)
	{
		draw_set_color(color_Outline);
		draw_rectangle(px,py,px+phowtall,py-pwidth,1);
	}
	draw_set_color(color_background);
	draw_rectangle(px,py,px+phowtall,py-pwidth,0)
	draw_set_color(color_Progress);
	draw_rectangle(px,py,px+pvalue,py-pwidth,0)
	draw_set_color(color_label);
	draw_set_font(font_label);
	draw_text(px,py-pwidth-20,label);
	}else
	{
			
		
	}
}

function gel_textScroll(xx,yy,textt,text_spd,fontt,color_text,spaceBetweenEachLine,MaxWidth)
{
	gel_resetScrollingText();
	draw_set_font(fontt);
	draw_set_color(color_text);
	if !variable_instance_exists(self.id, "LetterCounter"){
    
      LetterCounter = 0;
	  
	}
	if !variable_instance_exists(self.id, "text_speed"){
    
      spd = text_spd;
	  
	}
	if(LetterCounter!=string_length(textt))
	{
		
		LetterCounter +=spd;
		
		textpart = string_copy(textt,1,LetterCounter);
		draw_text_ext(xx,yy,textpart,spaceBetweenEachLine,MaxWidth);	
	}
	

	
	
}

