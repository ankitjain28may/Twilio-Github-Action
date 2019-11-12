# Twilio-Github-Action

Send an SMS from [GitHub Actions](https://github.com/features/actions) using [Twilio](https://www.twilio.com/).

## Usage

```workflow
on: [push]

jobs:
  send-sms:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Send an SMS using Twilio.
      id: sms
      uses: ankitjain28may/Twilio-Github-Action@master
      env:
        SID: ${{ secrets.SID }}
        AUTH_TOKEN: ${{ secrets.AUTH_TOKEN }}
      with:
        from: ${{ secrets.FROM }}
        to: ${{ secrets.TO }}
        body: "Hello world"
    - name: Get the output status
      run: echo "The status of the message is ${{ steps.sms.outputs.status }}"
    - name: Get the error message
      run: echo "The status of the message is ${{ steps.sms.outputs.error }}"
```

It will send a "Hello world" message from the number specified in `secrets.FROM` to `secrets.TO`. It is recommended to use secrets rather exposing directly in the code.

### Outputs

1. `status`: The status of the message.
2. `error`: the error message.

### Inputs

This action requires the following inputs:

#### from (Required)

This must be a Twilio phone number that you own, formatted with a "+" and country code.

#### to (Required)

This must be a destination phone number formatted with a "+" and country code.

#### body (Required)

Text message to send.

#### SID (Required)

This should be the Twilio ACCOUNT SID and it should be passed as environment variable through secrets.

```text
env:
    SID: ${{ secrets.SID }}
```

#### AUTH_TOKEN (Required) 

This should be the Twilio ACCOUNT AUTH TOKEN and it should also be passed as environment variable through secrets.

```text
env:
    AUTH_TOKEN: ${{ secrets.AUTH_TOKEN }}
```
