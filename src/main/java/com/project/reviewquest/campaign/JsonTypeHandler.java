package com.project.reviewquest.campaign;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class JsonTypeHandler implements TypeHandler<List<String>> {
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, List<String> strings, JdbcType jdbcType) throws SQLException {
        try {
            String jsonString = objectMapper.writeValueAsString(strings);
            preparedStatement.setString(i, jsonString);
        } catch (JsonProcessingException e) {
            throw new SQLException("Failed to convert List<String> to JSON");
        }
    }

    @Override
    public List<String> getResult(ResultSet resultSet, String s) throws SQLException {
        String jsonString = resultSet.getString(s);
        return parseJson(jsonString);
    }

    @Override
    public List<String> getResult(ResultSet resultSet, int i) throws SQLException {
        String jsonString = resultSet.getString(i);
        return parseJson(jsonString);
    }

    @Override
    public List<String> getResult(CallableStatement callableStatement, int i) throws SQLException {
        String jsonString = callableStatement.getString(i);
        return parseJson(jsonString);
    }

    private List<String> parseJson(String jsonString) throws SQLException {
        try {
            return objectMapper.readValue(jsonString, new TypeReference<List<String>>() {});
        } catch (IOException e) {
            throw new SQLException("Failed to parse JSON to List<String>");
        }
    }
}
