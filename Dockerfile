FROM python:3.12-slim

RUN python -m pip install --upgrade pip

RUN python -m pip install nicegui

WORKDIR /app

COPY ./app ./

RUN addgroup --system --gid 1001 radix-non-root-group
RUN adduser --system --uid 1001 --ingroup radix-non-root-group --home /home/radix-non-root-user radix-non-root-user
RUN chown -R radix-non-root-user:radix-non-root-group /app /home/radix-non-root-user
USER 1001

EXPOSE 8080

CMD ["python", "main.py"]