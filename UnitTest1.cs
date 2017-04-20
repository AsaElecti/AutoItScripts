using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using OpenQA.Selenium.Chrome;
using System.Diagnostics;
using System.Threading;
using OpenQA.Selenium.Remote;
using OpenQA.Selenium.PhantomJS;


namespace Tests
{
    [TestClass]
    public class UnitTest1
    {
        public void creatDocFromTree(IWebDriver driver, int rnk)//метод, проходит путь создания документа до выбора самого документа
        {
            driver.FindElement(By.XPath("//*[@id='menu']/li[1]/a")).Click();// переходим на "Клиенты"
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//*[@id='tdcorporate']")).Click();// переходим на юридических лиц
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbCCRNK']")).SendKeys(rnk.ToString());// заполняем поле РНК значением
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbCCRNK']")).SendKeys(Keys.Enter);//Нажимаем Enter
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(35));//Ждем пока загрузятся результаты поиска
            driver.FindElement(By.XPath("//*[@id='1']/td[2]/a")).Click();//Нажимаем на первый "ПІБ" в списке
            driver.FindElement(By.XPath("//*[@id='aspnetForm']/header/div[3]/table/tbody/tr/td[2]/div[2]/table/tbody/tr[2]/td[3]")).Click();//переходим на "документы"
            driver.FindElement(By.XPath("//*[@id='AddDocumentButton']")).Click();//нажимаем "Додати документ"
        }

        public void saveDoc(IWebDriver driver)//метод, сохраняет док угоди после нажатия на кнопку "Додати скан-копию" 
        {
            driver.FindElement(By.XPath("//*[@id='showDocScanTab']")).Click();//нажимаем "Додати скан-копію"
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_AsyncFileUpload1_ctl02']")).Click();
            Process.Start("C:\\Mine\\Code\\AutoIT\\UploadFile.exe");
            Thread.Sleep(10000);
            driver.FindElement(By.XPath("//*[@id='SaveButton']")).Click();//нажимаем "Сохранить"
            Thread.Sleep(12000);
            driver.SwitchTo().Alert().Accept();
            Thread.Sleep(9000);//ждеm
        }

        public void creatDocPrScanner(int n, IWebDriver driver, int rnk)// Создаем док для сделки ПР с помощью сканирования
        {
            for (int i = 0; i < n; i++)
            {
                // add a doc to PR with scanner
                creatDocFromTree(driver, rnk);
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tvAllDocumentsn89']/img")).Click();// разворачиваем дерево
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tvAllDocumentsn93']/img")).Click();// разворачиваем дерево
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tvAllDocumentst94']")).Click();// выбираем "Заява на відкриття ПР"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlDocumentStatus']/option[4]")).Click();// выбираем статус "Діючий"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddAgreementExternalIds']/option[2]")).Click();// Вибираем "Новий проект"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbDocComment']")).SendKeys("Документ створено автоматично");// заполняем поле РНК значением
                driver.FindElement(By.XPath("//*[@id='showDocScanTab']")).Click();//нажимаем "Додати скан-копію"
                Thread.Sleep(3000);
                //driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(20));//ждем
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_cbUseFeeder']")).Click();//убираем чек-бокс "Использовать автоподатчик"
                driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(2));//ждем
                driver.FindElement(By.XPath("//*[@id='ScanButton']")).Click();//Нажимаем сканировать
                Thread.Sleep(14000);//ждем
                driver.FindElement(By.XPath("//*[@id='SaveButton']")).Click();//нажимаем "Сохранить"
                Thread.Sleep(10000);//ждем
                driver.SwitchTo().Alert().Accept();// push "OK"
                Thread.Sleep(9000);//ждем
            }
        }

        public void creatDocPr(int n, IWebDriver driver, int rnk) // Создаем док для сделки ПР - добавляя файл из диска
        {
            for (int i = 0; i < n; i++)
            {
                // add a doc to PR by uploading from local disk
                creatDocFromTree(driver, rnk);
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tvAllDocumentsn89']/img")).Click();// разворачиваем дерево
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tvAllDocumentsn93']/img")).Click();// разворачиваем дерево
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tvAllDocumentst94']")).Click();// выбираем "Заява на відкриття ПР"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlDocumentStatus']/option[4]")).Click();// выбираем статус "Діючий"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddAgreementExternalIds']/option[2]")).Click();// Вибираем "Новий проект"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbDocComment']")).SendKeys("Документ створено автоматично");// заполняем поле РНК значением
                saveDoc(driver);
            }
        }

        public void creatDocDep(int n, IWebDriver driver, int rnk) //Создаем док для сделки DEP - добавляя файл из диска
        {
            for (int i = 0; i < n; i++)
            {
                // add a doc to PR by uploading from local disk
                creatDocFromTree(driver, rnk);
                driver.FindElement(By.Id("ctl00_ContentPlaceHolder1_tvAllDocumentsn155")).Click();// разворачиваем дерево
                driver.FindElement(By.Id("ctl00_ContentPlaceHolder1_tvAllDocumentsn156")).Click();// разворачиваем дерево
                driver.FindElement(By.Id("ctl00_ContentPlaceHolder1_tvAllDocumentst159")).Click();// выбираем "Депозитний договір"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlDocumentStatus']/option[4]")).Click();// выбираем статус "Діючий"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddAgreementExternalIds']/option[2]")).Click();// Вибираем "Новий проект"
                driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbDocComment']")).SendKeys("Документ створено автоматично");// заполняем поле РНК значением
                saveDoc(driver);
            }
        }

        public void goToAgreement(IWebDriver driver, int rnk)
        {
            driver.FindElement(By.XPath("//*[@id='menu']/li[1]/a")).Click();// переходим на "Клиенты"
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//*[@id='tdcorporate']")).Click();// переходим на юридических лиц
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbCCRNK']")).SendKeys(rnk.ToString());// заполняем поле РНК значением
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbCCRNK']")).SendKeys(Keys.Enter);//Нажимаем Enter
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(30));//Ждем пока загрузятся результаты поиска
            driver.FindElement(By.XPath("//*[@id='1']/td[2]/a")).Click();//Нажимаем на первый "ПІБ" в списке
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));
            driver.FindElement(By.XPath("//*[@id='aspnetForm']/header/div[3]/table/tbody/tr/td[2]/div[2]/table/tbody/tr[2]/td[2]")).Click();//переходим на "угоды"
            Thread.Sleep(5000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(30));//Ждем пока загрузятся результаты поиска

        }

        public void getOneAgreementNumber(IWebDriver driver, int rnk) //Вытягивем номера проектов сделок из архива
        {

            goToAgreement(driver, rnk);
            driver.FindElement(By.XPath("//*[@id='1']/td[6]")).Click();
            string depAgrNumber = driver.FindElement(By.XPath("//*[@id='1']/td[6]")).Text.ToString();//copy depAgr number
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\depAgrNumber.txt", depAgrNumber);// write him to file
        }

        public void getAgreementNumbers(IWebDriver driver, int rnk) //Вытягивем номера проектов сделок из архива
        {

            goToAgreement(driver, rnk);
            driver.FindElement(By.XPath("//*[@id='1']/td[6]")).Click();
            string depAgrNumber = driver.FindElement(By.XPath("//*[@id='1']/td[6]")).Text.ToString();//copy depAgr number
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\depAgrNumber.txt", depAgrNumber);// write him to file
            driver.FindElement(By.XPath("//*[@id='2']/td[6]")).Click();
            string prAgrNumber = driver.FindElement(By.XPath("//*[@id='2']/td[6]")).Text.ToString();// copy prAgr number
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\prAgrNumber.txt", prAgrNumber);// write him to file
            driver.Quit();
        }

        public void checkReport(string branch, string date) //Лезем в отчет и делаем проверку под IE
        {

            //InternetExplorerOptions options = new InternetExplorerOptions();
            //options.IntroduceInstabilityByIgnoringProtectedModeSettings = true;
            //IWebDriver driver = new InternetExplorerDriver(options);
            IWebDriver driver = new InternetExplorerDriver();
            Thread.Sleep(5000);

            driver.Navigate().GoToUrl("https://eashp-01-01.oschadbank2.ua/Reports.aspx");
            //запускаем скрипт для прохождения авторизации на IE
            Thread.Sleep(10000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\EAAutorization.exe");
            Thread.Sleep(12000);

            driver.FindElement(By.Id("ctl00_ContentPlaceHolder1_CountOpenAccounts")).Click();// переходим на "Звіт
            Thread.Sleep(10000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\EAAutorization.exe");// aurorization again
            Thread.Sleep(5000);

            driver.FindElement(By.XPath("//*[@id='AccountAmountReportTab']")).Click();//нажимаем на ближний элемент к форме, на который можем нажать)
            driver.FindElement(By.XPath("//*[@id='AccountAmountReportTab']")).SendKeys(Keys.Tab);//нажимаем один раз ТАБ для приближения к полю(второй раз нажать на получается) дальше выход для AutoIT
            Thread.Sleep(10000);

            //запускаем скрипт для запуска отчета
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\StartReport.exe");
            Thread.Sleep(25000);

            string reportMessage = "REPORT IS Wrong! GO AHEAD AND SEE BY YOURSELF (date = " + date + ")";
            Assert.IsTrue(driver.PageSource.Contains("Звіт"), reportMessage);

            //СЧИТАТЬ ДАННЫЕ НЕ ВЫХОДИТ. ТАК КАК ДРАЙВЕР НЕ ВИДИТ НИЧЕГО ЧТО ГЕНЕРИТ ЭТА "СТАРННАЯ ПАНЕЛЬКА" В ПРИНЦИПЕ ОН ВИДИТ НА ХРОМЕ, ВОЗМОЖНО В ДАЛЬНЕЙШЕМ МОЖНО БУДЕТ НАПИСАТЬ ЧЕК-ТЕСТ НА НЕМ
            //ЕДИНСТВЕННОЕ ЧТО ТУТ ПРОВЕРЯЕТСЯ ЭТО ЕСТЬ ЛИ ТЕКСТ "ЗВІТИ" НА СТРАНИЦЕ, ЕСЛИ НЕТ ГЕНЕРИТ ОШИБКУ С МОИМ ТЕКСТОМ

        }

        public void creatTestData(string branch, string date) //Описан сам процесс создания данных на одном из бранч-уровней
        {
            // прописываем РНК имя
            int rnk = 100010004 + DateTime.Now.Hour + DateTime.Now.Minute;
            string name = "ООО Соняшник";


            // записываем данные в файлы
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\rnk.txt", rnk.ToString());
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch.txt", branch);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\name.txt", name);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\date.txt", date);

            // запускаем скрипт для создания копр клиента емулятором
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatCorpClient.exe");
            Thread.Sleep(32000);

            IWebDriver driver = new FirefoxDriver();
            string loginName = "svc.01.ea.unitedback@oschadbank2";
            string pass = "P@ssw0rd";
            driver.Navigate().GoToUrl("https://" + loginName + ":" + pass + "@eashp-01-01.oschadbank2.ua");//переходим на адресс имя логин и пароль

            // создаем доки для создания проэктов сделок
            //creatDocPrScanner(0, driver, rnk);
            creatDocPr(1, driver, rnk);
            creatDocDep(1, driver, rnk);

            //лезем в ЕА и копируем номера сделок
            Thread.Sleep(1000);
            getAgreementNumbers(driver, rnk);
        }

        public void synchrAgrAcc()
        {
            //запускаем скрипт для синхронизации депозитной и поточной и создания кпк и дбо
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatAgrAll.exe");
            Thread.Sleep(38000);

            //запускаем скрипт для создания всех счетов во всех статусах для всех существующих сделок
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatAccountsAll.exe");
            Thread.Sleep(55000);
        }


        [TestMethod]
        public void TestMethod_11413()// создаем 81 счёт на разных уровнях branch
        {
            string date = "7/28/2017 11:43:57";//MM/DD/YYYY
            //string branch = "/335106/000570/060570/";
            string branch = "/336503/000142/060142/";

            creatTestData(branch, date);
            synchrAgrAcc();
            //branch = "/335106/000218/";
            branch = "/336503/000142/";
            creatTestData(branch, date);
            synchrAgrAcc();
            //branch = "/335106/";
            branch = "/336503/";
            creatTestData(branch, date);
            synchrAgrAcc();
            checkReport(branch, date);
        }

        [TestMethod]
        public void TestMethod_4431()//4431:Унікальна ідентифікація проектів депозитної угоди
        {
            // прописываем РНК имя
            int rnk = 100020004 + DateTime.Now.Hour + DateTime.Now.Minute;
            string name = "Cucomber inc.";
            string branch = "/336503/";
            string date = "2/6/2017 11:43:57";//MM/DD/YYYY

            // записываем данные в файлы
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\rnk.txt", rnk.ToString());
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch.txt", branch);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\name.txt", name);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\date.txt", date);

            // запускаем скрипт для создания копр клиента емулятором
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatCorpClient.exe");
            Thread.Sleep(32000);

            IWebDriver driver = new FirefoxDriver();
            string loginName = "svc.01.ea.unitedback@oschadbank2";
            string pass = "P@ssw0rd";
            driver.Navigate().GoToUrl("https://" + loginName + ":" + pass + "@eashp-01-01.oschadbank2.ua");//переходим на адресс имя логин и пароль

            // создаем док для создания проэктa сделкi
            creatDocDep(1, driver, rnk);

            Thread.Sleep(1000);
            string localAgrNumber = "12345";

            goToAgreement(driver, rnk);

            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > a:nth-child(1)")).Click();
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Редагувати"), "текст РЕДАГУВАТИ не знайдений!");
            driver.FindElement(By.XPath("//*[@id='btnEdit']")).Click();// push Редагувати button
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).Clear();// очищаем поле "Номер договору"
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).SendKeys(localAgrNumber);// Заполняем поле "Номер договору" данными
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnSave']")).Click();//нажимаем "Зберегти"
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем

            // создаем док для создания проэктa сделкi
            creatDocDep(1, driver, rnk);

            goToAgreement(driver, rnk);//пытаемся создать вторую угоду с таким же номером

            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(1) > a:nth-child(1)")).Click();
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Редагувати"), "текст РЕДАГУВАТИ не знайдений!");
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnEdit']")).Click();// push Редагувати button
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).Clear();// очищаем поле "Номер договору"
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).SendKeys(localAgrNumber);// Заполняем поле "Номер договору" данными
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnSave']")).Click();//нажимаем "Зберегти"
            Assert.IsTrue(driver.PageSource.Contains("Відмінити"), "текст Відмінити не знайдений!");// проверяем отсутствие кнопки "Відмінити"
            Thread.Sleep(3000);//жестко ждем!
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Клієнт вже має угоду с таким номером!"), "текст <Клієнт вже має угоду с таким номером!> не знайдений!");// проверяем наличие текста об ошибке


        }

        [TestMethod]
        public void TestMethod_12571()//Унікальна ідентифікація проектів поточної угоди
        {
            // прописываем РНК имя
            int rnk = 100020004 + DateTime.Now.Hour + DateTime.Now.Minute;
            string name = "Corn inc.";
            string branch = "/336503/";
            string date = "2/7/2017 11:43:57";//MM/DD/YYYY

            // записываем данные в файлы
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\rnk.txt", rnk.ToString());
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch.txt", branch);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\name.txt", name);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\date.txt", date);

            // запускаем скрипт для создания копр клиента емулятором
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatCorpClient.exe");
            Thread.Sleep(32000);

            IWebDriver driver = new FirefoxDriver();
            
            string loginName = "svc.01.ea.unitedback@oschadbank2";
            string pass = "P@ssw0rd";
            driver.Navigate().GoToUrl("https://" + loginName + ":" + pass + "@eashp-01-01.oschadbank2.ua");//переходим на адресс имя логин и пароль

            // создаем док для создания проэктa сделкi
            creatDocPr(1, driver, rnk);

            Thread.Sleep(1000);
            string localAgrNumber = "12345";

            goToAgreement(driver, rnk);

            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > a:nth-child(1)")).Click();
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Редагувати"), "текст РЕДАГУВАТИ не знайдений!");
            driver.FindElement(By.XPath("//*[@id='btnEdit']")).Click();// push Редагувати button
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).Clear();// очищаем поле "Номер договору"
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).SendKeys(localAgrNumber);// Заполняем поле "Номер договору" данными
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnSave']")).Click();//нажимаем "Зберегти"
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем

            // создаем док для создания проэктa сделкi
            creatDocPr(1, driver, rnk);

            goToAgreement(driver, rnk);//пытаемся создать вторую угоду с таким же номером

            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(1) > a:nth-child(1)")).Click();
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Редагувати"), "текст РЕДАГУВАТИ не знайдений!");
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnEdit']")).Click();// push Редагувати button
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).Clear();// очищаем поле "Номер договору"
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).SendKeys(localAgrNumber);// Заполняем поле "Номер договору" данными
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnSave']")).Click();//нажимаем "Зберегти"
            Assert.IsTrue(driver.PageSource.Contains("Відмінити"), "текст Відмінити не знайдений!");// проверяем отсутствие кнопки "Відмінити"
            Thread.Sleep(3000);//жестко ждем!
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Клієнт вже має угоду с таким номером!"), "текст <Клієнт вже має угоду с таким номером!> не знайдений!");// проверяем наличие текста об ошибке
        }

        [TestMethod]
        public void TestTest()//Тест для экспериментов
        {
            //FirefoxDriverService service = FirefoxDriverService.CreateDefaultService(@"C:\Users\AChabala\Documents\Visual Studio 2017\Projects\TestProject\packages\Selenium.WebDriver.GeckoDriver.Win64.0.15.0\driver\");
            //service.FirefoxBinaryPath = @"C:\Program Files\Mozilla Firefox\firefox.exe";
            //IWebDriver driver = new FirefoxDriver(service);
            
            //FirefoxOptions options = new FirefoxOptions();
            //options.UseLegacyImplementation = true;
            //IWebDriver driver = new FirefoxDriver(options);

            IWebDriver driver = new FirefoxDriver();

            //Notice navigation is slightly different than the Java version
            //This is because 'get' is a keyword in C#
            driver.Navigate().GoToUrl("https://www.google.com/");
            Thread.Sleep(5000);//жестко ждем!
            IWebElement query = driver.FindElement(By.Name("q"));
            query.SendKeys("Cheese");
            Thread.Sleep(3000);//жестко ждем!
            System.Console.WriteLine("Page title is: " + driver.Title);
            // TODO add wait
            Thread.Sleep(3000);//жестко ждем!
            driver.Quit();
        }

        [TestMethod]
        public void TestMethod_606()//606:Синхронізація Депозитної угоди - Позитивний сценарій
        {
            // прописываем РНК имя

            int rnk = 2000100014 + DateTime.Now.Hour + DateTime.Now.Minute;
            string name = "The elephant3 inc.";
            string branch = "/336503/";
            string branch2 = "/336503/000129/";
            string branch3 = "/336503/000142/060142/";
            string date = "2/7/2017 11:43:57";//MM/DD/YYYY

            // записываем данные в файлы
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\rnk.txt", rnk.ToString());
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch.txt", branch);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch2.txt", branch2);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch3.txt", branch3);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\name.txt", name);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\date.txt", date);

            // запускаем скрипт для создания копр клиента емулятором
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatCorpClient.exe");
            Thread.Sleep(35000);

            IWebDriver driver = new FirefoxDriver();
            string loginName = "svc.01.ea.unitedback@oschadbank2";
            string pass = "P@ssw0rd";
            driver.Navigate().GoToUrl("https://" + loginName + ":" + pass + "@eashp-01-01.oschadbank2.ua");//переходим на адресс имя логин и пароль        

            // создаем док для создания проэктa сделкi
            creatDocDep(1, driver, rnk);

            Thread.Sleep(1000);
            string localAgrNumber = "12345";

            goToAgreement(driver, rnk);

            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > a:nth-child(1)")).Click();
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Редагувати"), "текст РЕДАГУВАТИ не знайдений!");
            driver.FindElement(By.XPath("//*[@id='btnEdit']")).Click();// push Редагувати button
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).Clear();// очищаем поле "Номер договору"
            Thread.Sleep(1000);
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).SendKeys(localAgrNumber);// Заполняем поле "Номер договору" данными
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnSave']")).Click();//нажимаем "Зберегти"
            Thread.Sleep(12000);//Задержка большая, без нее вылетает странная ошибка
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(15));//ждем

            getOneAgreementNumber(driver, rnk);//лезем в ЕА и копируем номер сделки, который потом записываем в файл, который будет использоваться AutoIT скриптом

            Thread.Sleep(3000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatAgrForDepSyncronycation.exe");
            Thread.Sleep(102000);//длительность выполнения скрипта

            //------------
            goToAgreement(driver, rnk);

            Thread.Sleep(5000);
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='1']/td[1]")).Text.ToString()) == ("321"), "НЕ совпадает номер сделки");//проверяем  номер сделки
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='1']/td[9]")).Text.ToString()) == ("Закрито"), "НЕ совпадает статус сделки");//проверяем статус сделки
            Thread.Sleep(5000);
            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > a:nth-child(1)")).Click();// переходим на первую сделку в списке
            Thread.Sleep(5000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем


            //Проверяем версию 6
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Дмитренко Дмитро Дмитрович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Закрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//*[@id='btnOldVersionsReferrer']")).Click();//Переходим на "отримати старі версії"
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем

            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']")).Click();//кликаем на выпадающий список с версиями
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем

            //Проверяем версию 1
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[2]")).Click();//Выбираем значение 1: выпадающий список отличается не всегда присутствует пункт "Выберитье версию"
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Проект"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 2
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[2]")).Click();//Выбираем значение 2
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Проект"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 3
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[3]")).Click();//Выбираем значение 3
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Павлюченко Валентина Андріївна"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Відкрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 4
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[4]")).Click();//Выбираем значение 4
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Петренко Петро Петрович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch2), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Відкрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 5
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[5]")).Click();//Выбираем значение 5
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Петренко Петро Петрович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch3), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Закрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди


            //тут будет код
        }

        [TestMethod]
        public void TestMethod_591()//Test Case 591: Синхронізація поточної угоди
        {
            // прописываем РНК имя

            int rnk = 500300014 + DateTime.Now.Hour + DateTime.Now.Minute;
            string name = "The elephant4 inc.";
            string branch = "/336503/";
            string branch2 = "/336503/000129/";
            string branch3 = "/336503/000142/060142/";
            string date = "2/7/2017 11:43:57";//MM/DD/YYYY

            // записываем данные в файлы
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\rnk.txt", rnk.ToString());
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch.txt", branch);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch2.txt", branch2);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\branch3.txt", branch3);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\name.txt", name);
            System.IO.File.WriteAllText(@"C:\Mine\Code\AutoIT\date.txt", date);

            // запускаем скрипт для создания копр клиента емулятором
            Thread.Sleep(1000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatCorpClient.exe");
            Thread.Sleep(35000);

            IWebDriver driver = new FirefoxDriver();
            string loginName = "svc.01.ea.unitedback@oschadbank2";
            string pass = "P@ssw0rd";
            driver.Navigate().GoToUrl("https://" + loginName + ":" + pass + "@eashp-01-01.oschadbank2.ua");//переходим на адресс имя логин и пароль        

            // создаем док для создания проэктa сделкi
            creatDocPr(1, driver, rnk);

            Thread.Sleep(1000);
            string localAgrNumber = "12347";

            goToAgreement(driver, rnk);

            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > a:nth-child(1)")).Click();
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем
            Assert.IsTrue(driver.PageSource.Contains("Редагувати"), "текст РЕДАГУВАТИ не знайдений!");
            driver.FindElement(By.XPath("//*[@id='btnEdit']")).Click();// push Редагувати button
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).Clear();// очищаем поле "Номер договору"
            Thread.Sleep(1000);
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).SendKeys(localAgrNumber);// Заполняем поле "Номер договору" данными
            Thread.Sleep(1000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем
            driver.FindElement(By.XPath("//*[@id='btnSave']")).Click();//нажимаем "Зберегти"
            Thread.Sleep(12000);//Задержка большая, без нее вылетает странная ошибка
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(15));//ждем

            getOneAgreementNumber(driver, rnk);//лезем в ЕА и копируем номер сделки, который потом записываем в файл, который будет использоваться AutoIT скриптом

            Thread.Sleep(3000);
            Process.Start("C:\\Mine\\Code\\AutoIT\\CreatAgrForPrSyncronycation.exe");
            Thread.Sleep(102000);//длительность выполнения скрипта

            //------------
            goToAgreement(driver, rnk);

            Thread.Sleep(5000);
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='1']/td[1]")).Text.ToString()) == ("321"), "НЕ совпадает номер сделки");//проверяем  номер сделки
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='1']/td[9]")).Text.ToString()) == ("Закрито"), "НЕ совпадает статус сделки");//проверяем статус сделки
            Thread.Sleep(5000);
            driver.FindElement(By.CssSelector("#AgreementGrid > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > a:nth-child(1)")).Click();// переходим на первую сделку в списке
            Thread.Sleep(5000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));//ждем


            //Проверяем версию 6
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Дмитренко Дмитро Дмитрович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Закрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//*[@id='btnOldVersionsReferrer']")).Click();//Переходим на "отримати старі версії"
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем

            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']")).Click();//кликаем на выпадающий список с версиями
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));//ждем

            //Проверяем версию 1
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[2]")).Click();//Выбираем значение 1: выпадающий список отличается не всегда присутствует пункт "Выберитье версию"
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Проект"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 2
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[2]")).Click();//Выбираем значение 2
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Проект"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 3
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[3]")).Click();//Выбираем значение 3
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Павлюченко Валентина Андріївна"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Відкрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 4
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[4]")).Click();//Выбираем значение 4
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Петренко Петро Петрович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch2), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Відкрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди

            //Проверяем версию 5
            driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_ddlSelectVersion']/option[5]")).Click();//Выбираем значение 5
            Thread.Sleep(3000);
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));//ждем

            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbUserName']")).GetAttribute("value").ToString()) == ("К'оваленко Іван Сергійович"), "НЕ совпадает користувач реєстратор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_txtBranchCode']")).GetAttribute("value").ToString()) == (branch), "НЕ совпадает branch регистратора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedUserName']")).GetAttribute("value").ToString()) == ("Петренко Петро Петрович"), "НЕ совпадает користувач актуализатор");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbModifiedBranchCode']")).GetAttribute("value").ToString()) == (branch3), "НЕ совпадает branch актуализатора");//проверяем поле користувач реєстратор
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbContractNumber']")).GetAttribute("value").ToString()) == (localAgrNumber), "НЕ совпадает localAgrNumber");//проверяем поле Номер договору
            Assert.IsTrue((driver.FindElement(By.XPath("//*[@id='ctl00_ContentPlaceHolder1_tbAgreementStatus']")).GetAttribute("value").ToString()) == ("Закрито"), "НЕ совпадает статус угоди");//проверяем поле Статус угоди


            //тут будет код
        }


    }

}
