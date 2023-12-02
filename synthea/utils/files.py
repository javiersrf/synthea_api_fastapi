from fastapi import UploadFile


def is_xml(file: UploadFile):
    content_type = file.content_type
    if content_type not in ["text/xml", "application/xml"]:
        return False
    return True


async def extract_xml_file_content(file: UploadFile):
    try:
        contents = file.file.read()
    except Exception:
        return None
    finally:
        file.file.close()
    return contents
