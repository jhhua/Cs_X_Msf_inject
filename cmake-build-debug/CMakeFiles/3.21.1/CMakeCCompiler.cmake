set(CMAKE_C_COMPILER "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/bin/gcc.exe")
set(CMAKE_C_COMPILER_ARG1 "")
set(CMAKE_C_COMPILER_ID "GNU")
set(CMAKE_C_COMPILER_VERSION "11.2.0")
set(CMAKE_C_COMPILER_VERSION_INTERNAL "")
set(CMAKE_C_COMPILER_WRAPPER "")
set(CMAKE_C_STANDARD_COMPUTED_DEFAULT "17")
set(CMAKE_C_COMPILE_FEATURES "c_std_90;c_function_prototypes;c_std_99;c_restrict;c_variadic_macros;c_std_11;c_static_assert;c_std_17;c_std_23")
set(CMAKE_C90_COMPILE_FEATURES "c_std_90;c_function_prototypes")
set(CMAKE_C99_COMPILE_FEATURES "c_std_99;c_restrict;c_variadic_macros")
set(CMAKE_C11_COMPILE_FEATURES "c_std_11;c_static_assert")
set(CMAKE_C17_COMPILE_FEATURES "c_std_17")
set(CMAKE_C23_COMPILE_FEATURES "c_std_23")

set(CMAKE_C_PLATFORM_ID "MinGW")
set(CMAKE_C_SIMULATE_ID "")
set(CMAKE_C_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_C_SIMULATE_VERSION "")




set(CMAKE_AR "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/bin/ar.exe")
set(CMAKE_C_COMPILER_AR "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/bin/gcc-ar.exe")
set(CMAKE_RANLIB "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/bin/ranlib.exe")
set(CMAKE_C_COMPILER_RANLIB "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/bin/gcc-ranlib.exe")
set(CMAKE_LINKER "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/bin/ld.exe")
set(CMAKE_MT "")
set(CMAKE_COMPILER_IS_GNUCC 1)
set(CMAKE_C_COMPILER_LOADED 1)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_C_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW 1)
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_C_COMPILER_ENV_VAR "CC")

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_C_COMPILER_ID_RUN 1)
set(CMAKE_C_SOURCE_FILE_EXTENSIONS c;m)
set(CMAKE_C_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_C_LINKER_PREFERENCE 10)

# Save compiler ABI information.
set(CMAKE_C_SIZEOF_DATA_PTR "8")
set(CMAKE_C_COMPILER_ABI "")
set(CMAKE_C_BYTE_ORDER "LITTLE_ENDIAN")
set(CMAKE_C_LIBRARY_ARCHITECTURE "")

if(CMAKE_C_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_C_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_C_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_C_COMPILER_ABI}")
endif()

if(CMAKE_C_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_C_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_C_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_C_CL_SHOWINCLUDES_PREFIX}")
endif()







	//example：_getTitle(L"xz.aliyun.com",80,FALSE, L"/t/10382",L"Cookie: UM_distinctid=17cb6323231eb-0d856633f9d722-333376b-144000-17cb6323232832;")
	//AllocConsole();   (CString _subDomain, int _subDomainPort, BOOL fUseSSL, CString _Path, CString _Cookie, BOOL UTF8)
	//freopen("CONIN$", "r", stdin);
	//freopen("CONOUT$", "w", stdout);
	//freopen("CONOUT$", "w", stderr);
	

	//下面是爬虫的获取url：
	HINTERNET hSession = NULL,   
		hConnect = NULL,     
		hRequest = NULL;    
	BOOL  bResults = FALSE;   
	DWORD dwSize = sizeof(DWORD);   
	DWORD dwStatusCode = 0;   
	DWORD dwDownloaded = 0;   
	LPSTR pszOutBuffer;
	LPVOID lpOutBuffer = NULL;    
	

	;

	
	hSession = WinHttpOpen(L"A WinHTTP Example Program/4.0",       
		WINHTTP_ACCESS_TYPE_DEFAULT_PROXY,
		WINHTTP_NO_PROXY_NAME,
		WINHTTP_NO_PROXY_BYPASS, 0);




	if (hSession) {
		hConnect = WinHttpConnect(hSession, LPCWSTR(_subDomain),      
			_subDomainPort,    //默认：INTERNET_DEFAULT_HTTP_PORT, 
			0);
		printf("hConnect good ：%s\n", hConnect);
	}
	if (hConnect) {
		hRequest = WinHttpOpenRequest(hConnect, L"GET",   
			LPCWSTR(_Path),   
			NULL,
			WINHTTP_NO_REFERER,     
			WINHTTP_DEFAULT_ACCEPT_TYPES,      
			(fUseSSL) ?
			WINHTTP_FLAG_SECURE : 0
		);   
		printf("hRequest good ：%s\n", hRequest);
	}
	//

	if (hRequest) {
		bResults = WinHttpAddRequestHeaders(hRequest,
			LPCWSTR(_Cookie),   //请求头内容    
			(ULONG)-1L,               //请求头长度
			WINHTTP_ADDREQ_FLAG_ADD
		);

	}

	if (hRequest) {
		bResults = WinHttpSendRequest(hRequest,
			WINHTTP_NO_ADDITIONAL_HEADERS,
			0, WINHTTP_NO_REQUEST_DATA, 0,
			0, 0);
		printf("Internet spider is running please wait....\n");  
		printf("bResults good ：true\n");  
	}

	if (!bResults) {
		return 0;   
		printf("Error %d has occurred.\n", GetLastError());
	}

	//接收请求
	if (bResults) {   
		bResults = WinHttpReceiveResponse(hRequest, NULL);
	}



	if (bResults)
		bResults = WinHttpQueryHeaders(hRequest,
			WINHTTP_QUERY_STATUS_CODE | WINHTTP_QUERY_FLAG_NUMBER,
			NULL,
			&dwStatusCode,
			&dwSize,
			WINHTTP_NO_HEADER_INDEX);

	if (bResults)
	{
		if (dwStatusCode == 302)
		{
			printf("Found.......jump to......:302\n");
		}
		else if (dwStatusCode == 200)
		{
			printf("Found:200\n");
		}
		else if (dwStatusCode == 500)
		{
			printf("Server Error.....:500\n");
		}
		else if (dwStatusCode == 404)
		{
			printf("Not Found.........:404\n");
		}
		else
		{
			printf("Server had some troble\n");
		}

	}



	//获取内容：返回的header内容
	if (bResults) {
		bResults = WinHttpQueryHeaders(hRequest,
			WINHTTP_QUERY_RAW_HEADERS_CRLF,
			WINHTTP_HEADER_NAME_BY_INDEX,
			NULL,
			&dwSize,
			WINHTTP_NO_HEADER_INDEX);
		// Allocate memory for the buffer.
		if (GetLastError() == ERROR_INSUFFICIENT_BUFFER)
		{
			lpOutBuffer = new WCHAR[dwSize / sizeof(WCHAR)];

			// Now, use WinHttpQueryHeaders to retrieve the header.
			bResults = WinHttpQueryHeaders(hRequest,
				WINHTTP_QUERY_RAW_HEADERS_CRLF,
				WINHTTP_HEADER_NAME_BY_INDEX,
				lpOutBuffer, &dwSize,
				WINHTTP_NO_HEADER_INDEX);

		}

	}
	printf("dwSize：%d\n", dwSize);
	if (bResults)
		printf("Header contents: \n%S", lpOutBuffer);
	delete[] lpOutBuffer;



   /*
   LPVOID lpHeaderBuffer = NULL;
   dwSize = 0;
   pszOutBuffer = NULL;
   dwDownloaded = 0;
   wchar_t* pwText = NULL;
   if (bResults)
   {
	   do
	   {
		   dwSize = 0;
		   if (!WinHttpQueryDataAvailable(hRequest, &dwSize)) {
			   printf("Error：WinHttpQueryDataAvailable failed：",GetLastError());
			   break;
		   }
		   if (!dwSize)    break;  

		   pszOutBuffer = new char[dwSize + 1];
		   if (!pszOutBuffer) {
			   printf("Out of memory.");
			   break;
		   }
		   ZeroMemory(pszOutBuffer, dwSize + 1);      

		   if (!WinHttpReadData(hRequest, pszOutBuffer, dwSize, &dwDownloaded)) {
			   printf("Error：WinHttpQueryDataAvailable failed：", GetLastError());
		   }
		   if (!dwDownloaded)
			   break;

	   } while (dwSize > 0);
	 
	   DWORD dwNum = MultiByteToWideChar(CP_ACP, 0, pszOutBuffer, -1, NULL, 0);    
	   pwText = new wchar_t[dwNum];                                               
	   MultiByteToWideChar(CP_UTF8, 0, pszOutBuffer, -1, pwText, dwNum);        
	   printf("Received contents: \n%S", pwText);
   }
   */
   



	CString allwebsite;   

	if (bResults)
	{
		do
		{
			dwSize = 0;
			if (!WinHttpQueryDataAvailable(hRequest, &dwSize))
				printf("Error %u in WinHttpQueryDataAvailable.\n",
					GetLastError());

			pszOutBuffer = new char[dwSize + 1];
			if (!pszOutBuffer)
			{
				printf("Out of memory\n");
				dwSize = 0;
			}
			else
			{

				ZeroMemory(pszOutBuffer, dwSize + 1);

				if (!WinHttpReadData(hRequest, (LPVOID)pszOutBuffer,
					dwSize, &dwDownloaded))
					printf("Error %u in WinHttpReadData.\n", GetLastError());
				else
				{
					


					CString tmp;

					if (!(UTF8 ? 1 : 0))
					{

						tmp = CString(pszOutBuffer); 
					}
					else
					{
						DWORD dwNum = MultiByteToWideChar(CP_UTF8, 0, pszOutBuffer, -1, NULL, 0);    //接收的网站是GBK的，那就不要用这个。。原：DWORD dwNum = MultiByteToWideChar(CP_ACP, 0, pszOutBuffer, -1, NULL, 0);  
						wchar_t* pwText = new wchar_t[dwNum];
						MultiByteToWideChar(CP_UTF8, 0, pszOutBuffer, -1, pwText, dwNum);
						tmp = CString(pwText);   //转CString
					}
					
					

					
					allwebsite += tmp;
					
				}


				// Free the memory allocated to the buffer.
				delete[] pszOutBuffer;
			}
		} while (dwSize > 0);
	}







	if (hRequest) WinHttpCloseHandle(hRequest);
	if (hConnect) WinHttpCloseHandle(hConnect);
	if (hSession) WinHttpCloseHandle(hSession);


	return allwebsite;   


set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/lib/gcc/x86_64-w64-mingw32/11.2.0/include;C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/include;C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/lib/gcc/x86_64-w64-mingw32/11.2.0/include-fixed;C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/x86_64-w64-mingw32/include")
set(CMAKE_C_IMPLICIT_LINK_LIBRARIES "mingw32;gcc;moldname;mingwex;kernel32;pthread;advapi32;shell32;user32;kernel32;iconv;mingw32;gcc;moldname;mingwex;kernel32")
set(CMAKE_C_IMPLICIT_LINK_DIRECTORIES "C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/lib/gcc/x86_64-w64-mingw32/11.2.0;C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/lib/gcc;C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/x86_64-w64-mingw32/lib;C:/Program Files/JetBrains/CLion 2021.3.4/bin/mingw/lib")
set(CMAKE_C_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
