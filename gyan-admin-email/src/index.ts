export default {
  async email(
    message: {
      forward:
        (
          destination:
            string,
        ) => Promise<void>;
    },
  ): Promise<void> {
    await Promise.all([
      message.forward(
        "anvit.vishwakarma.2014@gmail.com",
      ),

      message.forward(
        "alok.vishwakarma.1979@gmail.com",
      ),
    ]);
  },
};