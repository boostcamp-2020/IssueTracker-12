import axios from "axios";

export const getLabels = async () => {
  const token = process.env.AUTH_TOKEN;
  const apiurl = "http://localhost:8080/api/label";
  try {
    const result = await axios.get(apiurl, {
      headers: { Authorization: `Bearer ${token}` },
    });
    const { labelArray } = result.data;
    return labelArray;
  } catch (error) {
    console.error(error);
  }
};
