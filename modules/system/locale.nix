{ hostConfig, ... }: {
  time.timeZone = hostConfig.timezone;

  i18n.defaultLocale = hostConfig.defaultLocale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = hostConfig.locale;
    LC_IDENTIFICATION = hostConfig.locale;
    LC_MEASUREMENT = hostConfig.locale;
    LC_MONETARY = hostConfig.locale;
    LC_NAME = hostConfig.locale;
    LC_NUMERIC = hostConfig.locale;
    LC_PAPER = hostConfig.locale;
    LC_TELEPHONE = hostConfig.locale;
    LC_TIME = hostConfig.locale;
  };

  console.keyMap = hostConfig.consoleKeyMap;
}
