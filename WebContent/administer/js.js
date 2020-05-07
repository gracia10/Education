function addFile1(formName){
   if(formName.addcnt1.value==""){
      alert(" 입력할 파일 갯수를 입력하고 확인 단추를 눌러주세요" ); 
      formName.addcnt.focus();                   
      return;
   }
   formName.submit();
}

function addFile2(formName){
   if(formName.addcnt2.value==""){
      alert(" 입력할 파일 갯수를 입력하고 확인 단추를 눌러주세요" ); 
      formName.addcnt.focus();                   
      return;
   }
   formName.submit();
}

function addFile3(formName){
   if(formName.addcnt3.value==""){
      alert(" 입력할 파일 갯수를 입력하고 확인 단추를 눌러주세요" ); 
      formName.addcnt.focus();                   
      return;
   }
   formName.submit();
}

function elementCheck1(formName){
      paramIndex = 1; 
      count = 0;
      
      for(idx=0; idx<formName.elements.length; idx++){
            count++;
         }
      
      if(count==2){
         alert("입력할 파일 갯수를 입력하고 확인 단추를 눌러주세요");
         return;
      }
      
      for(idx=0; idx<formName.elements.length; idx++){
         if(formName.elements[idx].type == "file"){
            if(formName.elements[idx].value==""){
              var message = paramIndex+" 번째 파일정보가 없습니다.\n업로드할 파일을 선택해 주세요";
             alert(message);
            formName.elements[idx].focus();
            return;      
           }
           paramIndex++; 
         }
      }
      
      formName.action = "MainImgPro.do";   
      /*alert(formName.type.value);*/
      formName.submit();
      alert("수정 되었습니다.");
   }
   
function elementCheck2(formName){
      paramIndex = 1; 
      count = 0;
      
      for(idx=0; idx<formName.elements.length; idx++){
            count++;
         }
      
      if(count==2){
         alert("입력할 파일 갯수를 입력하고 확인 단추를 눌러주세요");
         return;
      }
      
      paramIndex = 1; 
      for(idx=0; idx<formName.elements.length; idx++){
         if(formName.elements[idx].type == "file"){
            if(formName.elements[idx].value==""){
              var message = paramIndex+" 번째 파일정보가 없습니다.\n업로드할 파일을 선택해 주세요";
             alert(message);
            formName.elements[idx].focus();
            return;      
           }
           paramIndex++; 
         }
      }

         formName.action = "IntroduceImgPro.do";
      /*alert(formName.type.value);*/
      formName.submit();
      alert("수정 되었습니다.");
   }
   
function elementCheck3(formName){
      paramIndex = 1; 
      count = 0;
      
      for(idx=0; idx<formName.elements.length; idx++){
            count++;
         }
      
      if(count==2){
         alert("입력할 파일 갯수를 입력하고 확인 단추를 눌러주세요");
         return;
      }
      
      paramIndex = 1; 
      for(idx=0; idx<formName.elements.length; idx++){
         if(formName.elements[idx].type == "file"){
            if(formName.elements[idx].value==""){
              var message = paramIndex+" 번째 파일정보가 없습니다.\n업로드할 파일을 선택해 주세요";
             alert(message);
            formName.elements[idx].focus();
            return;      
           }
           paramIndex++; 
         }
      }
         formName.action = "ServiceImgPro.do";
      /*alert(formName.type.value);*/
      formName.submit();
      alert("수정 되었습니다.");
   }