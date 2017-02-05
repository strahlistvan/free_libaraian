package configXML;

import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.stream.StreamSource;

import org.xml.sax.SAXException;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;

public class XMLHandler 
{  
	private SAXParser parser;
	private String xsdFilePath = "default.xsd";
	
	public XMLHandler()
	{
		try 
		{
			SAXParserFactory spf = SAXParserFactory.newInstance();
			spf.setValidating(true);
			parser = spf.newSAXParser();
		} 
		catch (ParserConfigurationException | SAXException ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public XMLHandler(String xsdFilePath)
	{
		this();
		this.xsdFilePath = xsdFilePath;
	}
	
	private String readFile(String xmlFilePath) throws IOException
	{
		BufferedReader reader = new BufferedReader(new FileReader(xmlFilePath));
		String xmlSource = "";
		String line = reader.readLine();
		while (line != null)
		{
			xmlSource += line;
			line = reader.readLine();
		}
		reader.close();
		
		return xmlSource;
	}
	
	public boolean isValid(String xmlFilePath)
	{
		try 
		{
			String xmlSource = readFile(xmlFilePath);
			System.out.println(xmlFilePath);
			System.out.println(xmlSource);
			StreamSource source = new StreamSource(new StringReader(xmlSource));
		}
		catch (IOException ex) 
		{
			ex.printStackTrace();
		}
		return true;
	}
}
