FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app
## Step 2:
# Copy source code to working directory
COPY .  /app
## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --upgrade pip &&\
    pip install -i https://mirrors.aliyun.com/pypi/simple  -r requirements.txt
## Step 4:
# Expose port 80
Expose 80
## Step 5:
# Run app.py at container launch
CMD ["python","app.py"]
