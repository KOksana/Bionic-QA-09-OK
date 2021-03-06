function Main()
{
  try
  {
    preperation();
    AddOrders(); 
    editOrders();
    deleteOrders();
    cleanup();
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}
 function preperation()
 {
   TestedApps.Orders.Run();
 }
 
function AddOrders()
{
  var ordersNumber = 5;
  var  groupBox = Aliases.Group;
  
  // create new orders in cycle
  
  for(i = 0; i < ordersNumber; i++)
  {
    Aliases.MainForm.MainMenu.Click("Orders|New order...");
    
    groupBox.ProductNames.ClickItem("FamilyAlbum");
    groupBox.Quantity.wValue = 2;

    groupBox.Price.wText = "$100";
    
    groupBox.Discount.wText = "0%";
   
    groupBox.groupBox1.TotalPrice.wText = "200";
 
    groupBox.Date.wDate = "06.04.2006";
    
    groupBox.Customer.wText = "Customer"+i;
 
    groupBox.Street.wText = "Street"+i;

    groupBox.City.wText = "City"+i;

    groupBox.State.wText = "State"+i;

    groupBox.Zip.wText = "Zip"+i;
    
    groupBox.MasterCard.ClickButton();
    
    groupBox.CardNo.wText = "1111";
    
    groupBox.ExpDate.wDate = "06.05.2006";
    
    Aliases.OrderForm.ButtonOK.ClickButton();
    
    //select current item
     Aliases.MainForm.OrdersView.selectItem(i);
    //check Custumer Name in current item
    if (Aliases.MainForm.OrdersView.FocusedItem.Text.OleValue  != "Customer"+i)
      Log.Error("The property value does not equal the baseline value");
    else 
      Log.Message("OK");
  }
}


function deleteOrders()  
{
    //count := number of orders
     var count = Aliases.MainForm.OrdersView.wItemCount;
     for (i=0; i<count;i++)
     {
        // select first item
       Aliases.MainForm.OrdersView.selectItem(0);
       // delete current item
       Aliases.MainForm.MainMenu.Click("Orders|Delete order") ;                               
       Aliases.dlgConfirmation.btn_ok.ClickButton();
       
     }
     
}
function editOrders()  
{
     var count = Aliases.MainForm.OrdersView.wItemCount;
     for (i=0; i<count;i++)
     {
       //select current item
       Aliases.MainForm.OrdersView.selectItem(i);
       //change Customer Name
       Aliases.MainForm.OrdersView.FocusedItem.set_Text("Cust"+i);
       //check Custumer Name in current item 
       if (Aliases.MainForm.OrdersView.FocusedItem.Text.OleValue != "Cust"+i)
          Log.Error("The property value does not equal the baseline value");
       else 
          Log.Message("OK");  
     }   
}

function cleanup()
{
  Aliases.MainForm.Close();
  Aliases.dlgConfirmation.btn_doNotSave.ClickButton(); 
}