FROM python:3.11-slim
WORKDIR /usr/src/app
COPY chatgpt_connector.py ./
RUN pip install flask openai
CMD ["python", "chatgpt_connector.py"]
