from fastapi import UploadFile
import PyPDF2
import io

def is_xml(file: UploadFile):
    content_type = file.content_type
    if content_type not in ["text/xml", "application/xml"]:
        return False
    return True


def is_pdf(file: UploadFile):
    content_type = file.content_type
    if content_type not in ["application/pdf"]:
        return False
    return True

async def extract_xml_from_pdf(file: UploadFile):
    content = await file.read()
    reader = PyPDF2.PdfReader(io.BytesIO(content))
    xml_content = ""
    for _, page in enumerate(reader.pages):
        xml_content += page.extract_text()
    return xml_content

async def extract_xml_file_content(file: UploadFile):
    try:
        contents = file.file.read()
    except Exception:
        return {"message": "There was an error uploading the file(s)"}
    finally:
        file.file.close()
    return contents
